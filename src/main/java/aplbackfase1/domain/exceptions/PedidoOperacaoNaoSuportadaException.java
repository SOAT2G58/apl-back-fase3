package aplbackfase1.domain.exceptions;

public class PedidoOperacaoNaoSuportadaException  extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public PedidoOperacaoNaoSuportadaException() {
        super("Operação não suportada");
    }

    public PedidoOperacaoNaoSuportadaException(String msg) {
        super(msg);
    }
}
