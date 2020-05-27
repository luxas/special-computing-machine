package tuf

import (
	"crypto/ecdsa"
	"crypto/sha256"
	"crypto/x509"
	"encoding/base64"
	"fmt"
	"log"
	"math/big"

	"github.com/sirupsen/logrus"
)

// Manual verification of a notary TUF manifest using go packages

func testtufnotary() error {
	msg := []byte(`{"_type":"Timestamp","expires":"2020-05-27T03:45:48.417090674Z","meta":{"snapshot":{"hashes":{"sha256":"EcNNKSwkzEWAJMG+VNUrgHiuihfs81pE/bNbxV2y3rg=","sha512":"UJsoKt5RTwzrUm5JxstXoq6mqlNKluEcJU35fpYYSfPkop0L4kxryRRgLNyj/ucF1PHKdUveJAjO2jEmDg5B1A=="},"length":687}},"version":2106}`)

	sigStr := "Z6CuX3ex4v8cZx96bnagoz39ibPgoDEne3riAMbTZ4YXxlmORCJmlMKOgx+TnRA38miFX7M1XKh8wNtmWvBvHw=="
	sig, err := base64.StdEncoding.DecodeString(sigStr)
	if err != nil {
		return err
	}
	logrus.Infof("sig (len: %d) is: %x", len(sig), sig)

	keyID := "628b0c4ec148075104e8ba30625aba7461754bd4f08ace05746b75f8c04395e8"
	keyStr := "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE2ACIDBRD/hSEayT3AbzWcjaX3turZJS7ChrBWGfZjqyDgnfIEo2ZtzEft1PrAO7+5qWcQk/7r6QbnOb9tyacDw=="
	key, err := base64.StdEncoding.DecodeString(keyStr)
	if err != nil {
		return err
	}
	logrus.Infof("key (len: %d) is: %x", len(key), key)
	pubKey, err := x509.ParsePKIXPublicKey(key)
	if err != nil {
		return fmt.Errorf("Failed to parse private key for keyID: %s, %s\n", keyID, err)
	}

	ecdsaPubKey, ok := pubKey.(*ecdsa.PublicKey)
	if !ok {
		return fmt.Errorf("value isn't an ECDSA public key")
	}

	sigLength := len(sig)
	expectedOctetLength := 2 * ((ecdsaPubKey.Params().BitSize + 7) >> 3)
	if sigLength != expectedOctetLength {
		return fmt.Errorf("signature had an unexpected length")
	}

	rBytes, sBytes := sig[:sigLength/2], sig[sigLength/2:]
	r := new(big.Int).SetBytes(rBytes)
	s := new(big.Int).SetBytes(sBytes)

	digest := sha256.Sum256(msg)

	if !ecdsa.Verify(ecdsaPubKey, digest[:], r, s) {
		return fmt.Errorf("failed ECDSA signature validation")
	}

	log.Printf("Signature verified successfully!!!!")
	return nil
}

/*

# Convert base64 to hex on the command line, for notary
printf "4zpZyn6xnZulVL6qps/z2qUcQTz5dwE5N5UU2FJqt6k=" | base64 -d | od -A n -t x1 -w64 | sed "s| ||g"
# --> e33a59ca7eb19d9ba554beaaa6cff3daa51c413cf9770139379514d8526ab7a9

tuftool root init root.json

for i in 1..3; do
	tuftool root gen-rsa-key -r=root -b 4096 root.json keys/root-${i}.key
	openssl rsa -in keys/root-${i}.key -pubout 2>/dev/null > keys/root-${i}.key.pub
done

# Verify a key ID
printf "$(jq -c .signed.keys.<key-id> root.json)" | sha256sum
# --> <key-id>

tuftool root expire root.json "in 14 days"
tuftool root set-threshold root.json root 2

for role in snapshot timestamp targets; do
	tuftool root gen-rsa-key -r=${role} -b 4096 root.json keys/${role}.key
	openssl rsa -in keys/${role}.key -pubout 2>/dev/null > keys/${role}.key.pub
	tuftool root set-threshold root.json ${role} 1
done


printf "$(jq -c .signed root.json)" > root.data
printf "$(jq -r .signatures[0].sig root.json)" > root-1.sig

openssl dgst -sign keys/root-1.key -keyform PEM -sha256 -hex root.data
openssl dgst -verify keys/root-1.key.pub -keyform PEM -sha256 -signature root-1.sig root.data

tuftool create \
	-k keys/root-1.key \
	-k keys/root-2.key \
	-k keys/root-3.key \
	-k keys/snapshot.key \
	-k keys/targets.key \
	-k keys/timestamp.key \
	-r root.json \
	--snapshot-expires "in 7 days" \
	--targets-expires "in 14 days" \
	--timestamp-expires "in 2 days" \
	--snapshot-version 1 \
	--targets-version 1 \
	--timestamp-version 1 \
	indir \
	outdir

tuftool create \
	-k keys/root-1.key \
	-k keys/root-2.key \
	-k keys/root-3.key \
	-k keys/snapshot.key \
	-k keys/targets.key \
	-k keys/timestamp.key \
	-r root.json \
	--snapshot-expires "in 7 days" \
	--targets-expires "in 14 days" \
	--timestamp-expires "2020-05-14T14:24:42.363557495Z" \
	--snapshot-version 4 \
	--targets-version 4 \
	--timestamp-version 4 \
	indir \
	outdir

chmod -R a+r outdir

docker run -d -p 80:80 -v $(pwd)/outdir:/usr/share/nginx/html nginx:alpine

mkdir client
tuftool download \
	-m http://localhost/metadata \
	-t http://localhost/targets \
	-r ../root.json \
	-v 1 \
	client

-k keys/root-1.key \
-k keys/root-2.key \
-k keys/root-3.key \

mkdir /tmp/discard
tuftool refresh \
	-k keys/snapshot.key \
	-k keys/targets.key \
	-k keys/timestamp.key \
	--metadata-url http://localhost/metadata \
	-r root.json \
	--snapshot-expires "in 7 days" \
	--targets-expires "in 14 days" \
	--timestamp-expires "in 2 days" \
	--snapshot-version 2 \
	--targets-version 2 \
	--timestamp-version 2 \
	--outdir outdir \
	--workdir /tmp/discard

https://updates.bottlerocket.aws/2020-02-02/aws-k8s-1.15/x86_64/1.root.json
https://updates.bottlerocket.aws/targets/
https://updates.bottlerocket.aws/targets/b23fc5206282fd41a2a44f82153216a53dff197c9a8f97ef26d04986ffda7823.manifest.json

Bottlerocket args create: \
	--targets-expires 'in 2 weeks' \
	--targets-version $(date +%s) \
	--snapshot-expires 'in 2 weeks' \
	--snapshot-version $(date +%s) \
	--timestamp-expires 'in 5 days' \
	--timestamp-version $(date +%s)

*/
