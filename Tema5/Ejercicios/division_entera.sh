#!/bin/bash

division_entera() {
  if [ $# -ne 2 ]; then
    echo "Error: Introduce dos números enteros."
    return 1
  fi
  division=$(( $1 / $2 ))
  echo "El resultado es: $division"
}

division_entera 10 5
division_entera 4