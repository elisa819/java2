DROP TABLE fuctura.hospital;

--Primeiro devemos adicionar a nossa chave prim�ria.
--criar a tabela adicionando o ID como atributo identificado
CREATE TABLE fuctura.hospital (
    id     INT,     --atributo identificador
    nome_fantasia   VARCHAR(100), --like
    cnpj            VARCHAR(100), --like
    data_abertura   DATE,
    razao_social    VARCHAR(200), --like
    capacidade      INT,
    CONSTRAINT hospital_pk PRIMARY KEY ( id ) -- adicionando ID como atributo identificado. 
);


--Segundo criamos a tabela de de controle de sequencia. 
--Esta tabelas nos fornecer� um conjunto de n�mero em sequencia come�ando com 1. Ou seja: 1,2,3,4,...999999999
DROP SEQUENCE fuctura.hospital_seq; --_seq � s� nomenclatura para ajudar na leitura.
CREATE SEQUENCE fuctura.hospital_seq START WITH 1; --informar que o primeiro elemento da tabela ser� 1. O incremento padr�o � 1.


--Por �ltimo, criaremos uma trigger ou um gatilho que toda vez que n�s chamamos o comando de insert.
--Este gatinho ser� invocado e ir� pegar o pr�ximo n�mero sequ�ncia da nossa sequence.
CREATE OR REPLACE TRIGGER fuctura.hospital_bir BEFORE --_bir � s� nomenclatura para ajudar na leitura.
    INSERT ON fuctura.hospital
    FOR EACH ROW
BEGIN
    SELECT
        fuctura.hospital_seq.NEXTVAL
    INTO :new.id --bater com o nome da chave primaria, utilizada no create. Neste caso � ID.
    FROM
        dual;
END;
/


--Sempre que for inserir na tabela voc� deve informar as colunas
INSERT INTO fuctura.hospital(
    nome_fantasia, 
    cnpj, 
    data_abertura,
    razao_social, 
    capacidade
) VALUES (
    'Hospital Alfa',
    '03.337.575/0001-92',
    '18-04-2019',
    'Hospital Alfa',
    100
);