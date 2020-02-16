typedef enum { 
    typeCon, 
    typeId, 
    typeOpr 
} nodeEnum;

typedef struct {
    int value; 
} conNodeType;

typedef struct {
    int i; 
} idNodeType;

typedef struct {
    int oper; /* operator */
    int nops; /* number of operands */
    struct nodeTypeTag **op; /* operands */
} oprNodeType;

typedef struct nodeTypeTag {
    nodeEnum type; /* type of node */
    union {
        conNodeType con; /* constants */
        idNodeType id; /* identifiers */
        oprNodeType opr; /* operators */
    };
} nodeType;

extern int sym[26];
