words with a fixed meaning across all projects.

## Settings
- **config**: written specification that inits the project's settings, or part of them
- **args**: command line arguments
- **env**: anything and everything picked up from the environment
- **settings**: everything the project reads at runtime to determine behavior. Constructed from any combination of config, args, env, and cache

### Updates
- args are passed once, at startup.
- config can change while the program runs, and the program is expected to pick the change up.
- settings can change at runtime, by the user or by the program itself, without touching config, and can persist over to the next session. A config change takes priority over persisted settings.

> `Settings { config, .. }` is fine: what goes into config vs what doesn't is a semantic split anyway.
