for n in 00-vpc 10-sg 20-bastion 50-backend-aln; do
  cd $n
  terraform apply -auto-approve
  cd ..
done
