#!/bin/bash

ansible all -u root -m user -a "name=automation password={{ '123' | password_hash('sha512') }}"

ansible all -u root -m authorized_key -a "user=automation state=present key={{ lookup('file', '/home/automation/.ssh/id_rsa.pub') }}"


ansible all -u root -m shell -a "echo 'automation ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers" 







