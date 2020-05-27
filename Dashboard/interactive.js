





var cluster = {                                      //example array
    name: "Cluster 1",
    racks: [
        {
            name: "Rack 1",
            firmwareVersion: 1.0,
            servers: [
                {
                    name: "Pi 1",
                    cpuModel: "BCM2711",
                    cpuUsage: 1.5,
                    poweredOn: true
                },
                {
                    name: "Pi 2",
                    cpuModel: "BCM2712",
                    cpuUsage: 2.5,
                    poweredOn: false
                },
                {
                    name: "Pi 3",
                    cpuModel: "BCM2711",
                    cpuUsage: 2.5,
                    poweredOn: false
                },
                {
                    name: "Pi 4",
                    cpuModel: "BCM2713",
                    cpuUsage: 2.5,
                    poweredOn: false
                }
            ]
        },
        {
            name: "Rack 2",
            firmwareVersion: 2.0,
            servers: [
                {
                    name: "Pi 1",
                    cpuModel: "BCM2713",
                    cpuUsage: 0.5,
                    poweredOn: true
                },
                {
                    name: "Pi 2",
                    cpuModel: "BCM2711",
                    cpuUsage: 0.5,
                    poweredOn: true
                },
                {
                    name: "Pi 3",
                    cpuModel: "BCM2712",
                    cpuUsage: 2.5,
                    poweredOn: false
                },
                {
                    name: "Pi 4",
                    cpuModel: "BCM2712",
                    cpuUsage: 2.5,
                    poweredOn: false
                }

            ]
        }
    ]
}



// function on_pi_click(){

// }

// function on_rack_click(){

// }


/* <div id="whole_cluster" class="column is-two-fifths">
             <!-- Pi Controller --></div> */

    // <div class="racks buttons btn-group-vertical btn-group-lg" style="width: 300px">
    // <button class="container btn disabled">
    //     <p>Rack 1</p>
    // </button>
    // <button class="container btn" onclick="click_a_pi(pi1, 1, 1)">
    //     <p>Raspberry Pi 1</p>
    // </button>
    // <button class="container btn" onclick="click_a_pi(pi2, 2, 1)">
    //     <p>Raspberry Pi 2</p>
    // </button>
    // <button class="container btn" onclick="click_a_pi(pi3, 3, 1)">
    //     <p>Raspberry Pi 3</p>
    // </button>
    // <button class="container btn" onclick="click_a_pi(pi4, 4, 1)">
    //     <p>Raspberry Pi 4</p>
    // </button>
    // </div>


// </div>

cluster.racks.forEach((rack, racki) => {
    var one_rack = document.createElement("div")
    one_rack.className = "racks buttons btn-group-vertical btn-group-lg"
    one_rack.style.width = "300px"

    var rack_button = document.createElement("button")
    rack_button.className="container btn disabled"
    rack_button.setAttribute("data-rack-index", racki)
    var rack_name = "Rack".concat(racki)
    rack_button.textContent = rack_name
    //rack_button.addEventListener("click", on_rack_click)

    one_rack.appendChild(rack_button)

    rack.servers.forEach((server, serveri) => {
        var server_button = document.createElement("button")
        server_button.className = "container btn"
        server_button.textContent = server.name + " (" + (server.poweredOn ? "on" : "off") + ")"
        server_button.setAttribute("data-rack-index", racki)
        server_button.setAttribute("data-server-index", serveri)
        //server_button.addEventListener("click", on_pi_click)
        one_rack.appendChild(server_button)
    })
    document.getElementById("whole_cluster").appendChild(one_rack)
})