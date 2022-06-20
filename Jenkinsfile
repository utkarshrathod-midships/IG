def installAnsible(){
    sh """
        echo "Current Directory"
        cd $WORKSPACE
        pwd
        echo ""
        echo "listing directory"
        env
        ls -ltr $WORKSPACE
        ls -ltr $WORKSPACE/jenkins
        ls -ltr $WORKSPACE/jenkins/scripts
        ls -ltr $WORKSPACE/jenkins/scripts/Installing_Ansible.sh
        chmod +x "jenkins/scripts/Installing_Ansible.sh"
        echo ""
        jenkins/scripts/Installing_Ansible.sh
    """
}

// importing awt class  
import java.awt.*;   
public class Environment {    
  
         // class constructor  
        Environment() {    
  
        // creating a frame  
        Frame f = new Frame();    
  
        // creating a choice component  
        Choice c = new Choice();   
  
        // setting the bounds of choice menu   
        c.setBounds(100, 100, 75, 75);    
  
        // adding items to the choice menu  
        c.add("IDM");    
        c.add("IG");    
        c.add("AM");    
        c.add("DS");      
  
        // adding choice menu to frame  
        f.add(c);    
  
        // setting size, layout and visibility of frame  
        f.setSize(400, 400);    
        f.setLayout(null);    
        f.setVisible(true);    
     }    
  
// main method  
    public static void main(String [] args)
{    
   new Environment();    
}    
}   
pipeline {
    agent any
    
    parameters {
        choice(
            name: 'env_type',
            choices: 'uat,pit,prod',
            description: 'Environment to deploy to')
          choice(
            name: 'Component_type',
            choices: 'AM, IG, IDM, DS',
            description: 'Component to deploy to')      
        booleanParam(
            name: 'deploy_env',
            defaultValue: false, 
            description: 'Setting up Environment')
        string(
            name: 'project',
            defaultValue: 'Test',
            description: 'Project Name')
    }
    
    environment {
        EXAMPLE = "EXAMPLE"
    }
 
 stages{
        stage('Setting up Environment') {
            when {
                expression { params.deploy_env == true }
            }
            steps {
                echo "*** Setting up Environment ***"
                installAnsible()
                sh """
                    cd $WORKSPACE/ansible/
                    chmod 400 keys/id_rsa
                    cd playbooks
                    ansible-playbook setting_up_env.yaml
                """
            }
        }
 }       
        }
