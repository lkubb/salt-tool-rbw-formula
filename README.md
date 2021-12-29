# `rbw` Formula
Sets up, configures and updates `rbw` inofficial Bitwarden cli client.

## Usage
Applying `tool-rbw` will make sure `rbw` is configured as specified.

## Configuration
### Pillar
#### General `tool` architecture
Since installing user environments is not the primary use case for saltstack, the architecture is currently a bit awkward. All `tool` formulas assume running as root. There are three scopes of configuration:
1. per-user `tool`-specific
  > e.g. generally force usage of XDG dirs in `tool` formulas for this user
2. per-user formula-specific
  > e.g. setup this tool with the following configuration values for this user
3. global formula-specific (All formulas will accept `defaults` for `users:username:formula` default values in this scope as well.)
  > e.g. setup system-wide configuration files like this

**3** goes into `tool:formula` (e.g. `tool:git`). Both user scopes (**1**+**2**) are mixed per user in `users`. `users` can be defined in `tool:users` and/or `tool:formula:users`, the latter taking precedence. (**1**) is namespaced directly under `username`, (**2**) is namespaced under `username: {formula: {}}`.

```yaml
tool:
######### user-scope 1+2 #########
  users:                         #
    username:                    #
      xdg: true                  #
      dotconfig: true            #
      formula:                   #
        config: value            #
####### user-scope 1+2 end #######
  formula:
    formulaspecificstuff:
      conf: val
    defaults:
      yetanotherconfig: somevalue
######### user-scope 1+2 #########
    users:                       #
      username:                  #
        xdg: false               #
        formula:                 #
          otherconfig: otherval  #
####### user-scope 1+2 end #######
```

#### User-specific
The following shows an example of `tool-rbw` pillar configuration. Namespace it to `tool:users` and/or `tool:rbw:users`.
```yaml
user:
  rbw:
    email: elliotalderson@protonmail.ch
    base_url: https://api.bitwarden.com/
    identity_url: https://identity.bitwarden.com/
    lock_timeout: 3600
    pinentry: pinentry
```

#### Formula-specific
```yaml
tool:
  rbw:
    defaults: # default rbw config values for users go here
      base_url: https://api.bitwarden.com/
      identity_url: https://identity.bitwarden.com/
      lock_timeout: 3600
      pinentry: pinentry
```

## Todo
* currently, there is no way to force XDG dirs on MacOS
