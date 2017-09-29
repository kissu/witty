task :env_check_development => :environment do
    raise Exception.new("CAN ONLY RUN IN DEVELOPMENT") unless ::Rails.env.development?
end

task 'db:seed' => :env_check_development
