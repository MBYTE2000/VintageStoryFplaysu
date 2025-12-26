# Vintage Story для Nix

Nix flake для установки [Vintage Story](https://www.vintagestory.at/).

## Установка

### Для NixOS или Nix с включенными flakes:

```bash
# Установить пакет
nix profile install github:mbyte2000/vintagestory-nix

# Или запустить без установки
nix run github:mbyte2000/vintagestory-nix
```

```nix
{
  inputs = {
    vintagestory-nix.url = "github:mbyte2000/vintagestory-nix";
  };

  outputs = { self, nixpkgs, vintagestory-nix, ... }: {
    nixosConfigurations.your-host = nixpkgs.lib.nixosSystem {
      modules = [
        {
          environment.systemPackages = [
            vintagestory-nix.packages.${pkgs.system}.default
          ];
        }
      ];
    };
  };
}
```
