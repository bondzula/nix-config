{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      # uBlock Origin
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
      # Vue Dev Tools
      { id = "nhdogjmejiglipccpnnnanhbledajbpd"; }
      # KeePassXC-Browser
      { id = "oboonakemofpalcgghocfoadofidjkkk"; }
      # JSON Formatter
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; }
      # LanguageTool
      { id = "oldceeleldhonbafppcapldpdifcinji"; }
    ];
  };
}
