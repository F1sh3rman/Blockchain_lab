Bonus points - Deployed on sepolia

Contract address: 0x9Eb4a632305C3366BFc21d870Ab63Eb322a0D28b
Deposit Transaction ID: 0x5c6420d2fca2eb06f2cf71ba38fa675b6f93fada056253c6bed577cadc554b8c
Withdraw Transaction ID: 0xf7af9cf58b3c313d995bc2aaa6e4ee3dee2d9b6503fc7bbca4ce4edc2aaba272

Modified seperation of proof scripts:

For deposit:
od -An -v -t x1 ./target/proof | tr -d ' \n' | \
  sed 's/^.\{8\}//' | head -c 256 | \
  sed -E 's/.{64}/"0x&", /g' | sed 's/, $//; s/^/[ /; s/$/ ]/'

echo "\"0x$(od -An -v -t x1 ./target/proof | tr -d ' \n' | \
        sed 's/^.\{8\}//' | tail -c +257)\""

For withdraw:
od -An -v -t x1 ./target/proof | tr -d ' \n' | \
  sed 's/^.\{8\}//' | head -c 128 | \
  sed -E 's/.{64}/"0x&", /g' | sed 's/, $//; s/^/[ /; s/$/ ]/'

echo "\"0x$(od -An -v -t x1 ./target/proof | tr -d ' \n' | \
        sed 's/^.\{8\}//' | tail -c +129)\""

I have also inserted a bunch of images of the withdrawal and deposit process

Use of Gen AI: 
1. Chatgpt: Used for the script to remove the 4 inputs for deposit and 2 inputs for withdraw 
2. Chatgpt: Used for syntax corrections in deposit.nr and withdraw.nr