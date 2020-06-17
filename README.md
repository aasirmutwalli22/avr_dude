# avr_dude

## Install plugin

```yaml
dependencies:
  flutter_customs:
    git:
      url: https://github.com/aasirmutwalli22/flutter_customs.git
```
## Alert
    > currently only supported for windows desktop
    > plugin created with flutter version 1.20.0-1.0.pre.83 at master channel, as the flutter for windows support is not stable this plugin may not supported for other flutter versions

## Use

```dart

    String uploadLogs = '';
    void upload() async {
        AvrDudeConfig config = new AvrDudeConfig(
            programmer: 'arduino',
            controller: 'atmega328p',
            comPort: 'COM9',
            baudRate: '115200',
            hexFile: 'blink.ino.hex',
            workingDirectory: await AvrDudeConfig.getAvrDudeLocation(),
        );
        AvrDude().
        upload(config).
        then((ProcessResult value) => setState(() => uploadLogs=value.stderr));
    }

    Text(uploadLogs);
```