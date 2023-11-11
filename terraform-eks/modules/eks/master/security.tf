resource "aws_security_group" "cluster_master_sg" {
    name   = format("%s-master-sg", var.cluster_name)
    vpc_id = var.cluster_vpc.id

    egress {
        #Se você selecionar um protocolo de -1
        # (semanticamente equivalente a all, que não é um valor válido aqui), 
        # deverá especificar a from_porte to_portigual a 0
        protocol = "-1"
        from_port   = 0
        to_port     = 0
       
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        Name = format("%s-master-sg", var.cluster_name)
    }

}

resource "aws_security_group_rule" "cluster_ingress_https" {
    #Esse security group vai permitir a conexão HTTPS externa
    cidr_blocks = ["0.0.0.0/0"] #para uso empresarial, o ideal é referenciar o range de ip`s seguros
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    security_group_id = aws_security_group.cluster_master_sg.id
    type = "ingress"
}