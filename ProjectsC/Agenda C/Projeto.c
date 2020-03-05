//Alunos integrantes:
//Matheus de Almeida Correia
//Murilo dos Anjos Montino

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>
#include<conio.h>

typedef struct{
	char nome[31];
	char sobrenome[31];
	char email1[61];
	char email2[61];
	char email3[61];
	char tel1[20];
	char tel2[20];
	char tel3[20];
} Contato;

int numContatos=0;

int limiteListaAtual=0;

Contato* listaContato;

FILE* banco;

void init(){
	listaContato = malloc(2*sizeof(Contato));
}

void checarListaRealoca(){
	if(numContatos>=limiteListaAtual){
		limiteListaAtual = limiteListaAtual*limiteListaAtual;
		listaContato = realloc(listaContato, limiteListaAtual*sizeof(Contato));
	}else{
		listaContato = realloc(listaContato, limiteListaAtual*sizeof(Contato));
	}
}

void abreBanco(){
	banco = fopen("banco.txt", "r");			  //Abre o arquivo com registro dos contatos
	if(banco == NULL){
		printf("Arquivo nao pode ser aberto");
	}
	char temp[1000];
	fgets(temp, 1000, banco);
	numContatos = atoi(temp);
	fgets(temp, 1000, banco);
	limiteListaAtual = atoi(temp);
	checarListaRealoca();
	int cont = 0;
	while(fgets(temp, 1000, banco)){                           //puxa contatos do arroyz;
		strcpy(listaContato[cont].nome, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].sobrenome, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].email1, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].email2, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].email3, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].tel1, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].tel2, temp);
		
		fgets(temp, 1000, banco);
		strcpy(listaContato[cont].tel3, temp);
		cont++;
	}
	fclose(banco);
}

void salvaBanco(){
	int i;
	banco = fopen("banco.txt", "w");
	fprintf(banco, "%d\n", numContatos);
	fprintf(banco, "%d\n", limiteListaAtual);
	int cont=0;
	while(cont<numContatos){
		fprintf(banco, "%s\n", strtok(listaContato[cont].nome, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].sobrenome, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].email1, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].email2, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].email3, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].tel1, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].tel2, "\n"));
		fprintf(banco, "%s\n", strtok(listaContato[cont].tel2, "\n"));
		cont++;
	}
	fclose(banco);
}

void removerEspacos(char str[]) {
    int j = 0, i;
    for(i = 0; str[i]; i++) {
       if(str[i] != ' ') {
            str[j] = str[i];
            j++;
        }
    }
    str[j] = '\0';
}

void limpaContato(Contato out){
	strcpy(out.nome, "");
	strcpy(out.sobrenome, "");
	strcpy(out.email1, "");
	strcpy(out.email2, "");
	strcpy(out.email3, "");
	strcpy(out.tel1, "");
	strcpy(out.tel2, "");
	strcpy(out.tel3, "");
}



void imprimiContato(Contato c){
		printf("======================================================\n");
	if(c.sobrenome[0]!='-'){
		printf("            NOME: %s %s\n", strtok(c.nome, "\n"), strtok(c.sobrenome,"\n"));	
	}else{
		printf("            NOME: %s\n", strtok(c.nome, "\n"));
	}
	if(c.email1[0]!='-'){
		printf("            EMAIL: %s\n", strtok(c.email1, "\n"));	
	}
	if(c.email2[0]!='-'){
		printf("            EMAIL: %s\n", strtok(c.email2, "\n"));	
	}
	if(c.email3[0]!='-'){
		printf("            EMAIL: %s \n", strtok(c.email3, "\n"));	
	}
	if(c.tel1[0]!='-'){
		printf("            TELEFONE: %s\n", strtok(c.tel1, "\n"));	
	}
	if(c.tel2[0]!='-'){
		printf("            TELEFONE: %s\n", strtok(c.tel2, "\n"));	
	}
	if(c.tel3[0]!='-'){
		printf("            TELEFONE: %s\n", strtok(c.tel3, "\n"));	
	}
		printf("======================================================\n");
}

int validaEmail(char a[]){
	int i=0;
	if(!strcmp(a,"")){
		return 0;
	}
	while (i < strlen(a)){
        if((isalpha(a[i]) && islower(a[i]))|| a[i]=='@' || a[i]=='.')
        	i++;
        else
			return 0;	
	}
	return 1;
}

int validaTelefone(char a[]){
	int i=0;
	if(!strcmp(a,"")){
		return 0;
	}
	while (i < strlen(a)){
        if(isdigit(a[i]) || a[i]=='(' || a[i]==')' || a[i]==' ' || a[i]=='+')
        	i++;
        else
			return 0;	
	}
	return 1;
}

int buscaBinaria(char chave[],int min, int max){
	while(min<=max){
		int meio = (min+max)/2;
		int cmp = strcmp(chave, strtok(listaContato[meio].nome, "\n"));
		if(cmp<0){
			max = meio-1;
			continue;	
		}else   if(cmp==0){
					return meio;
				}else{
					min = meio+1;
					
				}
	}
	return -1;
}

int CharToInt(char c){
	return c - 48;
}

int igual(char nome1[31], char nome2[31], char sobrenome1[31], char sobrenome2[31]){
	return strcmp(nome1, strtok(nome2, "\n"))==0 && strcmp(sobrenome1, strtok(sobrenome2, "\n"))==0;
}

int cadastrado(char nome[31], char sobrenome[31]) {
   int cont;
   for(cont = 0;cont<numContatos;cont++){
     if(igual(nome, listaContato[cont].nome, sobrenome, listaContato[cont].sobrenome)){
		return 1;
	 }
   }
   return 0;
}

int removerContato(int indice){
	int i;
	for(i=indice;i<numContatos-1;i++){
		listaContato[i] = listaContato[i+1];
	}
	limpaContato(listaContato[i+1]);
	numContatos--;
}

void informacoesTelaNavegarES(){
	printf("\n");
	printf("(A)             Qualquer outra tecla               (D)\n");
	printf("<==            Para sair da navegacao              ==>");
}

char pegaCharERetorna(){
	while(1){
		if(kbhit()){
			break;
		}
	}
		
	char c = getch();
	return c;
}

void navegacaoParaDeletar(int indiceInicial){
	int indice = indiceInicial;
	while(1){
		imprimiContato(listaContato[indice]);
		printf("\n");
		printf("Quando estiver no Contato desejado, aperte ENTER para deletar");
		printf("\n");
		informacoesTelaNavegarES();
		char c = pegaCharERetorna();
		if(c=='a'||c=='A'){
			if(indice!=0){
				indice--;
			}
			system("cls");
			continue;
		}else   if(c=='d'||c=='D'){
					if(indice<numContatos-1){
						indice++;	
					}
					system("cls");
					continue;
				}else if(c==13){
					system("cls");
					removerContato(indice);
					break;
				}else{
					system("cls");
					break;
				}
	}
}

void navegacao(int indiceInicial){
	int indice = indiceInicial;
	while(1){
		imprimiContato(listaContato[indice]);
		printf("\n\n\n");
		informacoesTelaNavegarES();
		char c = pegaCharERetorna();
		if(c=='a'||c=='A'){
			if(indice!=0){
				indice--;
			}
			system("cls");
			continue;
		}else   if(c=='d'||c=='D'){
					if(indice<numContatos-1){
						indice++;	
					}
					system("cls");
					continue;
				}else{
					system("cls");
					break;
				}
	}
}

void pressioneQualquerTecla(){
	while(1){
		if(kbhit()){
			break;
		}
	}
	char c = getch();
}

void ordenaLista(){
	int i,j;
	Contato c;
	for(i=1;i<numContatos;i++){
		// verifica se str2 tem que vir depois da str1, se tiver troca de posição
		for(j=1; j<numContatos; j++){
			//Concatena pra remover esapaços e comparar;
			char nomeSobrenomeConcatenados1[100];
			strcpy(nomeSobrenomeConcatenados1, listaContato[j - 1].nome);
			strcat(nomeSobrenomeConcatenados1, listaContato[j - 1].sobrenome);
			
			char nomeSobrenomeConcatenados2[100];
			strcpy(nomeSobrenomeConcatenados2, listaContato[j].nome);
			strcat(nomeSobrenomeConcatenados2, listaContato[j].sobrenome);
			
			if (strcmp(nomeSobrenomeConcatenados1, nomeSobrenomeConcatenados2) > 0) {
	         	c = listaContato[j-1];
	         	listaContato[j-1] = listaContato[j];
	         	listaContato[j] = c;
      		}
		}
	}
}

int cadastra(Contato c){
		printf("* = Obrigatorio\n\n");
		printf("* Digite o nome do contato[Limite: 30]:");
		gets(c.nome);
		if(!strcmp(c.nome,"")){
			system("cls");
			printf("Nome não pode ser vazio!\nTente novamente...\n");
			pressioneQualquerTecla();
			limpaContato(c);
			return 0;
		}
	
		printf("Digite o sobrenome do contato[Limite: 30]:");
		gets(c.sobrenome);
		if(strlen(c.sobrenome)>30){
			system("cls");
			printf("Input com caracteres em excesso\nTente novamente...\n");
			pressioneQualquerTecla();
			limpaContato(c);
			return 0;
		}
	
		if(!strcmp(c.sobrenome,"")){
			strcpy(c.sobrenome, "-");
		}
	
		if(cadastrado(c.nome, c.sobrenome)){
			system("cls");
			printf("Contato ja cadastrado\nTente novamente...\n");
			pressioneQualquerTecla();
			limpaContato(c);
			return 0;
		}
	
		int h=1; //Adicionar email
		while (h<=3){
	
	        printf("Digite o email N %d: [Limite: 60]:", h);
	
	        char i[60] = "\0";
	        gets(i);
	
	        if(strlen(i)>60){
	            system("cls");
	            printf("Input com caracteres em excesso\nTente novamente...\n");
	            pressioneQualquerTecla();
	            limpaContato(c);
			return 0;
	        }
	
	        if(!validaEmail(i)){
	            if(!strcmp(i,"")){
					strcpy(i, "-");
	            }else{
				system("cls");
				printf("Email Invalido\n");
				pressioneQualquerTecla();
				limpaContato(c);
				return 0;
	            }
	        }
	        if (h == 1)
	        strcpy(c.email1, i);
	        if (h == 2)
	        strcpy(c.email2, i);
	        if (h == 3)
	        strcpy(c.email3, i);
	
			h++;
		}
	
	    h=1; //Adicionar telefones
		while (h<=3){
	
	        printf("Digite o telefone N %d: [Limite: 19]:", h);
	
	        char u[19];
	        gets(u);
	
	        if(strlen(u)>19){
	            system("cls");
	            printf("Input com caracteres em excesso\nTente novamente...\n");
	            pressioneQualquerTecla();
	            limpaContato(c);
			return 0;
	        }
			
	        if(!validaTelefone(u)){
		        if(!strcmp(u,"")){
					strcpy(u, "-");
		        }else{
		        	system("cls");
		        	printf("Telefone Invalido\nTente novamente...\n");
		            pressioneQualquerTecla();
		            limpaContato(c);
		            return 0;
				}            
	        }
	
	        if (h == 1)
	        strcpy(c.tel1, u);
	        if (h == 2)
	        strcpy(c.tel2, u);
	        if (h == 3)
	        strcpy(c.tel3, u);
	
			h++;
		}
	
		numContatos++;
		checarListaRealoca();
		listaContato[numContatos-1] = c;
		system("cls");
		imprimiContato(c);
	
		return 1;
}

int main(){
	init();								  			  //aloca memoria pra o array
	abreBanco();
	ordenaLista();
	//--------------------------------------------------------------------------------------------------------------
	int opc=1;
	while(opc){
		system("cls");
		printf("============================================       Numero de Contatos: %d\n", numContatos);
		printf("                    Menu                    \n");
		printf("============================================\n");
		printf("1. Inserir novo contato\n");
		printf("2. Pesquisar pelo nome\n");
		printf("3. Apagar contato pelo nome\n");
		printf("4. Apagar contato pela navegacao\n");
		printf("5. Navegar agenda\n");
		printf("0. Sair do programa(Salva suas alteracoes)\n\n");
		printf("Ingresse sua opcao: ");
		char c = pegaCharERetorna();
		if(!isdigit(c)){
			system("cls");
			continue;
		}else{
			opc = CharToInt(c);
		}
		switch(opc){
			case 1:
				system("cls");
				Contato c;
				if(cadastra(c)){
					ordenaLista();
					printf("Contato cadastrado com sucesso\n");
					printf("Pressione qualquer tecla para voltar ao menu...");
                	pressioneQualquerTecla();
					system("cls");
				}else{
					printf("Erro ao cadastrar contato...");
                	pressioneQualquerTecla();
					system("cls");		
				}
			break;

			case 2:
				if(numContatos){
					int indice;	
					char nome[31];
					system("cls");
					printf("Digite nome a ser pesquisado: ");
					gets(nome);
					system("cls");
					indice = buscaBinaria(nome,0,numContatos-1);
					if(indice!=-1)	
						navegacao(indice);
					else
						printf("Contato não encontrado!\n");
						printf("Pressione qualquer tecla para voltar ao menu...");
                		pressioneQualquerTecla();	
				}else{
					system("cls");
					printf("Não ha contatos na sua lista\n");
					printf("Pressione qualquer tecla para voltar ao menu...");
                	pressioneQualquerTecla();
				}
			break;

			case 3:
				if(numContatos){
					int indice;	
					char nome[31];
					system("cls");
					printf("Digite nome do contato a ser deletado: ");
					gets(nome);
					system("cls");
					indice = buscaBinaria(nome,0,numContatos-1);
					if(indice!=-1){
						navegacaoParaDeletar(indice);
						ordenaLista();
						printf("Contato deletado com sucesso!!\n");
						printf("Pressione qualquer tecla para voltar ao menu...");
	                	pressioneQualquerTecla();
	                	system("cls");
					}else{
						printf("Contato nao encontrado!\n\n");
						printf("Ir a navegacao para escolher um contato para deletar?\n\n('Y' para Sim / qualquer tecla para Nao)\n\n");
						char c = pegaCharERetorna();
						if(c=='y'||c=='Y'){
							system("cls");
							navegacaoParaDeletar(0);
							ordenaLista();
						}
						system("cls");
					}
				}else{
					system("cls");
					printf("Não ha contatos na sua lista\n");
					printf("Pressione qualquer tecla para voltar ao menu...");
                	pressioneQualquerTecla();
				}			
			break;

			case 4:
				if(numContatos){
					system("cls");
					navegacaoParaDeletar(0);
					ordenaLista();
				}else{
					system("cls");
					printf("Não ha contatos na sua lista\n");
					printf("Pressione qualquer tecla para voltar ao menu...");
                	pressioneQualquerTecla();
				}
			break;

			case 5:
				if(numContatos){
					system("cls");
					navegacao(0);
				}else{
					system("cls");
					printf("Não ha contatos na sua lista\n");
					printf("Pressione qualquer tecla para voltar ao menu...");
                	pressioneQualquerTecla();
				}	
			break;
			
			case 0:
			
			break;
		}
	}
	ordenaLista();
	salvaBanco();
	return 0;
	
}
