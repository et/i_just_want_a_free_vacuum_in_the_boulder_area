job_type :vacuum, "cd :path && bundle exec :task"

every 2.hours do
  vacuum "./scripts/runner"
end

