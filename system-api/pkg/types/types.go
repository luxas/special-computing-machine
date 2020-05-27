package types

type TypeMeta struct {
	Kind       string `json:"kind"`
	APIVersion string `json:"apiVersion"`
}
type ObjectMeta struct {
	Name        string            `json:"name"`
	UID         string            `json:"uid"`
	Labels      map[string]string `json:"labels"`      // Used for filtering, well-known include picloud.io/{mac,rack,cluster}
	Annotations map[string]string `json:"annotations"` // Used for arbitrary data storage
	OwnerRef    interface{}       `json:"ownerRef"`    // Should point to e.g. a Rack or Cluster
}

type Server struct {
	TypeMeta   `json:",inline"`
	ObjectMeta `json:"metadata"`

	Spec   ServerSpec   `json:"spec"`
	Status ServerStatus `json:"status"`
}

type PowerStatus string

const (
	PowerStatusOn     PowerStatus = "On"     // desired state is on
	PowerStatusOff    PowerStatus = "Off"    // desired state is off (first shut-down through systemd, then power cut)
	PowerStatusReboot PowerStatus = "Reboot" // desired state is to reboot (using systemd), and then switch power state to On
)

type ServerSpec struct {
	PowerStatus      PowerStatus `json:"powerStatus"`
	UserFriendlyName string      `json:"name"`
}
type ServerStatus struct {
	Hardware ServerHardware `json:"hardware"`
	Software ServerSoftware `json:"software"`
}

type ServerHardware struct {
	CPUModel string  `json:"cpuModel"` // User-friendly, e.g. "Cortex-A72"
	CPUSpeed float64 `json:"cpuSpeed"` // GHz
	CPUCores uint32  `json:"cpuCores"` // number of cores

	RAMSize  uint32  `json:"ramSize"`  // MiB
	RAMSpeed float64 `json:"ramSpeed"` // GHz

	Motherboard string `json:"motherboard"` // User-friendly, e.g. BCM2835 Raspberry Pi 4 V1.1
	Revision    string `json:"revision"`    // Machine-readable, e.g. 0x00c03111 for Pi 4 4GB

	Disks []ServerDisk `json:"disks"` // Array of storage media attached
	NICs  []ServerNIC  `json:"nics"`  // Array of network interfaces attached
}

type DiskUsage string // typed string for disk usages, e.g. "initrd", "boot", "root", "persistent-storage"

type ServerDisk struct {
	UUID   string      `json:"uuid"`   // Unique identifier for the disk. This is the array key.
	Model  string      `json:"model"`  // User-friendly model name
	Size   uint32      `json:"size"`   // MiB
	Usages []DiskUsage `json:"usages"` // Array of well-known usages, can have multiple

	// MountPath string      `json:"mountPath"` // Where the disk partitions are mounted?
}

type ServerNIC struct {
	Name       string   `json:"name"`       // e.g. eth0, wlp2s0, etc. This is the array key
	MACAddress string   `json:"macAddress"` // MAC address of the NIC
	IPAddress  []string `json:"ipAddress"`  // IP addresses of this interface. Should support both IPv4 and IPv6

	// Speed      uint32   `json:"speed"`      // Mbps
	// VLANID     uint32   `json:"vlanID"`     // What VLAN the network is configured to use
}

type ServerSoftware struct {
	BootloaderVersion string          `json:"bootloaderVersion"` // e.g. pieeprom-2020-04-16
	OS                OperatingSystem `json:"os"`                // Booted OS status
	Platform          string          `json:"platform"`          // As per Golang's definition
	KernelVersion     string          `json:"kernelVersion"`     // Report the kernel version
}

type OperatingSystemFlavor string // typed string for OSes

type OperatingSystem struct {
	Flavor  OperatingSystemFlavor `json:"flavor"`  // Well-known identifier of different OSes
	Version string                `json:"version"` // OS version/revision/git build (e.g. CoreOS)
}

type Rack struct {
	TypeMeta   `json:",inline"`
	ObjectMeta `json:"metadata"`

	Spec   ServerSpec   `json:"spec"`
	Status ServerStatus `json:"status"`
}

type RackSpec struct {
	PoweredOn        bool   `json:"poweredOn"`
	UserFriendlyName string `json:"name"`
}
type RackStatus struct {
	Hardware ServerHardware `json:"hardware"`
	Software ServerSoftware `json:"software"`
}

type Cluster struct {
	TypeMeta   `json:",inline"`
	ObjectMeta `json:"metadata"`

	Spec   ServerSpec   `json:"spec"`
	Status ServerStatus `json:"status"`
}

type ClusterSpec struct {
	ACME             ACME   `json:"acme"`
	UserFriendlyName string `json:"name"`
}

type ACMEProvider string

type ACME struct {
	Provider ACMEProvider `json:"provider"` // typed string for what DNS-01 provider to use. only providers of go-acme are supported
	APIKey   string       `json:"apiKey"`   // can contain structured info, like "{id}:{secret}" or so, depending on provider
}

type ClusterStatus struct {
	Hardware ServerHardware `json:"hardware"`
	Software ServerSoftware `json:"software"`
}
