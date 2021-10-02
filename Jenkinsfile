pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/housseinmomo/ansible_deploy2.git'
            }
        }
        stage('list of host') {
            steps {
                sh 'ansible -i inventory all --list-hosts'
            }
        }
        stage('Ping web-server') {
            steps {
                sh 'ansible -i inventory all -m ping'
            }
        }
        stage('Remote config') {
            steps {
                sh 'ansible -i inventory all -m gather_facts '
            }
        }
        stage('Remote time') {
            steps {
                sh 'ansible -i inventory all -m command -a uptime'
            }
        }
        stage('Update package from remote web-server') {
            steps {
                sh 'ansible -i inventory all -m apt -a update_cache=true --become --ask-become-pass'
            }
        }
        stage('Install vim in remote web-server') {
            steps {
                sh 'ansible -i inventory all -m apt -a name=vim-nox --become --ask-become-pass  '
            }
        }
        stage('Install nginx') {
            steps {
                // -b : executer des commandes avec sudo
                // -K : password pour l'elevation de privilege
                // state=absent : pour supprimer nginx 
                sh 'ansible -i inventory all -b -K -m apt -a "name=nginx state=latest"'
            }
        }
        stage('Nginx state stopped') {
            steps {
                // -b : executer des commandes avec sudo
                // -K : password pour l'elevation de privilege
                // state=absent : pour supprimer nginx 
                // -a : argument
                sh 'ansible -i inventory all -b -K -m service -a "name=nginx state=stopped"'
            }
        }
        stage('Copy file') {
            steps {
                sh 'ansible -i inventory all -b -K -m copy -a "src=file_for_web_server dest=/home/ubuntu/file_from_ansible_server"'
            }
        }
    }
}