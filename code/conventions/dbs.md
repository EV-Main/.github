we're following the standard of connected apps, - shared DB instance on container, apps just own their `DATABASE`s in it, matching exact app name. Eg `localhost:$POSTGRES_PORT/site_conductor`
