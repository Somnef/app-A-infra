#!/bin/bash

sub_dirs=('vpc' 'ecs_cluster' 'alb' 'ec2' 'ecr' 'task_definitions')
file_names=('main.tf' 'variables.tf' 'outputs.tf')

for file in "${file_names[@]}"; do
  touch "$file"
done

for dir in "${sub_dirs[@]}"; do
  mkdir -p "./modules/${dir}"
  for file in "${file_names[@]}"; do
    touch "./modules/${dir}/${file}"
  done
done
