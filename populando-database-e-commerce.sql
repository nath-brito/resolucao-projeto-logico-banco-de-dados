USE ecommerce;

INSERT INTO client(Fname, Minit, Lname, CPF, Adress, BirthDate) VALUES
			("Maria", "A", "Silva", 01234567890, "Rua Américo 123", "1985-01-12"),
            ("João", "B", "Oliveira", 12345678901, "Rua Santos 685", "1974-03-03"),
            ("Marcos", "D", "Cabral", 23456789012, "Rua Londres 987", "1988-03-07"),
            ("Rosa", "G", "Rocha", 34567890123, "Avenida São João 312", "1999-05-25"),
            ("Osvaldo", "L", "Souza", 45678901234, "Travessa Agosto 789", "1992-09-14"),
            ("Marília", "J", "Matos", 56789012345, "Rua Mares 778", "1991-03-17");
            
INSERT INTO product(Pname, Category, Description, Value, Rating, Size) VALUES
			("Bolsa Pequena", "Vestuário ", "Bolsa de mão", 150.00, 4.5, "small"),
			("Vestido Midi", "Vestuário", "Vestido de tamanho médio", 300.0, 5.0, "medium"),
			("Barco Pirata", "Brinquedo", "Barco Pirata para brincar", 50.0, 3.2, "small"),
			("Air Frier", "Eletrodoméstico", "Air Frier multiuso", 700.0, 4.1, "small"),
			("Geladeira Duas Portas", "Eletrodoméstico", "Geladeira moderna duas portas",  20000.0, 4.9, "large"),
			("Ventilador de Teto", "Eletrodoméstico", "Ventilador de Teto com controle", 500.0, 2.5, "medium");
            
INSERT INTO order_info(fk_client, Status, Description, Shipment, Payment_method) VALUES
			(1, 'Processando', "Uma geladeira e dois ventiladores de teto", 150, 'Dois Cartões'),
            (2, 'Processando', "Cinco barcos pirata", 10, 'Boleto'),
            (3, 'EmAndamento', "Três vestidos midi e uma bolsa pequena", 50, 'Cartão'),
            (4, 'Faturado', "Um air frier", 25, 'PIX'),
            (5, 'Enviado', "Uma geladeira", 150, 'Dois Cartões'),
            (6, 'Entregue', "Duas bolsas pequenas", 10, 'PIX');
            
INSERT INTO order_product(fk_order, fk_product, Quantity, Status) VALUES
			(1, 5, 1, 'Disponível'),
            (1, 6, 2, 'Disponível'),
            (2, 3, 5, 'SemEstoque'),
            (3, 2, 3, 'Disponível'),
            (3, 1, 1, 'Disponível'),
            (4, 4, 1, 'Disponível'),
            (5, 5, 1, 'SemEstoque'),
            (6, 1, 2, 'SemEstoque');
                        
INSERT INTO supplier(CNPJ, Trade_name, Contact_info, Adress) VALUES
			(01234567890123, "Produtos MEL", "produtosmel@produtosmel.com", "rua costa 123"),
            (12345678901234, "Mil e Um Produtos", "milprodutos@milprodutos.com", "avenida praiana 789"),
            (23456789012345, "Everything Store", "everythingstore@everythingstore.com", "avenida marrom 798");

INSERT INTO seller(CNPJ, Trade_name, Contact_info, Adress) VALUES
			(34567890123456, "Lojas 200", "lojas200@lojas200.com", "rua palmares 234"),
            (45678901234567, "Roupas 1001", "roupas1001@roupas1001.com", "alameda 25 147"),
            (56789012345678, "Toys Forever", "toysforever@toysforever.com", "avenida são jorge 842");
            
INSERT INTO storage(Location, Description) VALUES
			("setor 1", "vestuário"),
            ("setor 55", "eletrodoméstico"),
            ("setor 42", "brinquedo");
            
INSERT INTO product_storage(fk_product, fk_storage) VALUES
			(1, 1),
            (2, 1),
            (3, 3),
            (4, 2),
            (5, 2),
            (6, 2);
                        
INSERT INTO product_supplier(fk_product, fk_supplier) VALUES
			(1, 1),
            (2, 1),
            (3, 2),
            (4, 2),
            (5, 3),
            (6, 3);
            
INSERT INTO product_seller(fk_product, fk_seller) VALUES
			(1, 2),
            (2, 2),
            (3, 3),
            (4, 1),
            (5, 1),
            (6, 1);
