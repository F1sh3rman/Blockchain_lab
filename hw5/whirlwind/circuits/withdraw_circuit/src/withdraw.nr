use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

/*  depth is 8 (same tree as deposit)  */
fn main(
    /* private ------------------------------------------------------------ */
    r:       Field,          
    index:   Field,          // leaf index (kept private for privacy)
    path:    [Field; 8],     // sibling hashes for that leaf

    /* public  ------------------------------------------------------------ */
    root:    pub Field,      // current Merkle root
    id:      pub Field       // serves directly as the nullifier
) {
    
    let commitment = pedersen_hash([id, r]);

   
    let calc_root = compute_merkle_root(commitment, index, path);
    assert(calc_root == root);

    
}