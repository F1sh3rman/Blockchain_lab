use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;


fn main(
    
    r:       Field,          
    index:   Field,          
    path:    [Field; 8],      
    root:    pub Field,      
    id:      pub Field       
) {
    
    let commitment = pedersen_hash([id, r]);
    let calc_root = compute_merkle_root(commitment, index, path);
    assert(calc_root == root);
    
}