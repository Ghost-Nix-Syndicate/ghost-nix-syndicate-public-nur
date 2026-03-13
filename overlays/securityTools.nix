self: super: {

  # Group all hacking/security tools under a single namespace
  hacktools = {
    nmap        = super.nmap;
    wireshark   = super.wireshark;
    tcpdump     = super.tcpdump;
    hashcat     = super.hashcat;
    john        = super.john;
    metasploit  = super.metasploit;
    sqlmap      = super.sqlmap;
    nikto       = super.nikto;
  };

  # Bundle list if you want a single install group
  hacktoolsBundle = with self.hacktools; [
    nmap wireshark tcpdump hashcat john metasploit sqlmap nikto
  ];
}