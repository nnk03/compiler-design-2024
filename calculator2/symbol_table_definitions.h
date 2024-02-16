
#define MAX_VARIABLES 100

struct SymbolTable{
	char *name;
	double value;
};

typedef struct SymbolTable SymbolTable;

SymbolTable sym_table[MAX_VARIABLES];

SymbolTable *look_up(char *name);






