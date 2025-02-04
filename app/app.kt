fun runScript(script: String) {
        val process = Runtime.getRuntime().exec(arrayOf("sh", "-c", script))
            process.waitFor()
}

// Botão para instalar o ambiente
installButton.setOnClickListener {
        runScript("/data/data/com.termux/files/home/scripts/install_debian_proot.sh")
}

// Botão para iniciar o Firefox no Proot
startFirefoxProotButton.setOnClickListener {
        runScript("/data/data/com.termux/files/home/scripts/start_firefox.sh")
}

// Botão para iniciar o Firefox no LXC
startFirefoxLxcButton.setOnClickListener {
        runScript("/data/data/com.termux/files/home/scripts/start_firefox_lxc.sh")
}
}
}
}
}