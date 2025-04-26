use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

fn main(
id: Field,
r:  Field,
oldPath: [Field; 8],
oldRoot:   pub Field,
newRoot:   pub Field,
commitment:pub Field,
index:     pub Field,     // no spaces in a parameter name
) {
    let ZERO_LEAF: Field = (0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63);
    let calc_commitment = pedersen_hash([id, r]);
    assert(calc_commitment == commitment);

    let calc_old_root = compute_merkle_root(ZERO_LEAF, index, oldPath);
    assert(calc_old_root == oldRoot);

    let calc_new_root = compute_merkle_root(commitment, index, oldPath);
    assert(calc_new_root == newRoot);
}