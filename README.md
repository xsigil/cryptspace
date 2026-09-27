# cryptspace

Streamlined LUKS container manager with `pass` integration and XDG configuration.

`cryptspace` eliminates repetitive `cryptsetup` and `mount` boilerplate for external encrypted drives, providing safe attachment, process-checked unmounting, and automated key retrieval via [pass](https://www.passwordstore.org/).

## Features

- **XDG Conformance**: Reads default hardware identifiers and mount locations from `$XDG_CONFIG_HOME/cryptspace/config`.
- **Pass Integration**: Piped password injection from `pass(1)` eliminates interactive passphrase typing.
- **Fail-Safe Detach**: Inspects locking processes via `lsof` if an unmount attempt fails.
- **Persistent By-ID Support**: Designed for portable SSDs using persistent `/dev/disk/by-id/` naming.

## Installation

```sh
make install

```

## Configuration

Place your machine-specific configuration at `~/.config/cryptspace/config`:

```sh
DEVICE="/dev/disk/by-id/usb-WD_Elements_SE_SSD_...-part1"
PASS_ENTRY="local/backup_ssd"
MOUNT_POINT="${HOME}/workspace"
MAPPER_NAME="cryptspace"
```

## Usage

# Unlock and mount using default configuration
```sh
cryptspace open
```

# Check status
```sh
cryptspace status
```

# Unmount and close encrypted mapper safely
```sh
cryptspace close
```

# Ad-hoc override via flags
```sh
cryptspace open -d /dev/sdb1 -m /mnt/tmpvault -p personal/vault
```

## License

MIT
