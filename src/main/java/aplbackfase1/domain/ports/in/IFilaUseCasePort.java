package aplbackfase1.domain.ports.in;

import aplbackfase1.domain.exceptions.PedidoJaNaFilaException;
import aplbackfase1.domain.exceptions.PedidoNotSavedException;
import aplbackfase1.domain.model.Pedido;
import aplbackfase1.domain.model.PedidoFila;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface IFilaUseCasePort {

    public PedidoFila inserirPedidoNaFila(Pedido pedido) throws PedidoNotSavedException, PedidoJaNaFilaException;

    public Optional<PedidoFila> obterPedidoPorNumeroNaFila(Long numero);

    public Optional<PedidoFila> obterPedidoPorIdPedido(UUID id);

    public Page<PedidoFila> obterPedidosNaFila(Pageable paginacao);
}
