# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/home/deploy/nguoimexe/cron_log.log"

every 12.hours do
  command "PGPASSWORD='password' pg_dump -F c -v -U nguoimexe -h localhost nguoimexe_production -f /home/deploy/nguoimexe/nguoimexe_backup.psql"
end

