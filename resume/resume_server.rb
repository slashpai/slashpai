this_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(this_dir) unless $LOAD_PATH.include?(this_dir)

require 'resume_services_pb'
class ResumeServer < Details::Service
  def get_job(job_req, _unused_call)
    p "Received #{job_req} from client"
    Job.new(field: 'Cloud Operations', role: 'Senior System Engineer', experience: 7)
  end

  def get_interests(int_req, _unused_call)
    p "Received #{int_req} from client"
    Interests.new(areas: ['Programming', 'Distributed Computing', 'Designing Micro Services', 'Cloud Computing', 'Full Stack Web Development', 'Machine Learning'])
  end

  def get_skills(skill_req, _unused_call)
    p "Received #{skill_req} from client"
    Skills.new(skills: %w[Linux Hadoop Docker Kubernetes Chef Ansible Consul Terraform Openstack AWS Jenkins Zabbix Splunk Prometheus Grafana NewRelic git protobuf gRPC Selenium])
  end

  def get_programming_languages(prog_lang_req, _unused_call)
    p "Received #{prog_lang_req} from client"
    ProgrammingLanguages.new(languages: %w[C C++ Java Python Groovy Ruby Go Shell Scripting JavaScript])
  end

end

def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(ResumeServer)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main