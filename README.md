#Family Tree - Lisp

###Getting Started
---------------

From a terminal, execute your lisp interpreter on the file 'family-tree.lisp'


                                                                           Alfred - Barbara
                               
                                               /                              /                   \                      \
                                           /                                /                      \                          \
                                      /                                   /                          \                              \
                           Ceaser - Ulla                    Daisy - Valence      Eric - Walentyna       Fabio
                   /                |                 \                                                 /     \
             /                      |                     \                                            /       \
    Mabel - Xandra    Nadia - Yoshi    Odin                            Pablo     Qiana
               |
               |
           Rachel

####Functions and Macros
    (show-siblings-of 'Pablo *family*)                      //Qiana
    
    (are-siblings 'Pablo 'Eric *family*)                       //false
    
    (show-parents-of 'Ceaser *family*)                    //Alfred Barbara
    
    (is-parent 'Ceaser 'Odin *family*)                       //true
    
    (show-ancestors-of 'Rachel *family*)                //Ceaser Ulla
    
    (show-grandsons-of 'Ceaser *family*)              //Rachel
    
    (is-grandson 'Rachel 'Ulla *family*)                    //true       
