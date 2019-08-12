contrib_centrality = function(graph, method = "jaccard", weighted=T)
{
    # new adjacency matrix = A * D element-wise
    A = as_adjacency_matrix(graph) * (1 - similarity(graph, method = method))
    
    # create new dissimilarity graph
    # and release the memory of the matrix A
    net = graph_from_adjacency_matrix(A,weighted=weighted)    
    
    # compute the eigen vector centrality
    contrib = eigen_centrality(net)
    
    return(contrib$vector)
}