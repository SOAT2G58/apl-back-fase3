package aplbackfase1.domain.usecases;

import aplbackfase1.domain.enums.StatusPedido;
import aplbackfase1.domain.model.Pedido;
import aplbackfase1.domain.model.PedidoProduto;
import aplbackfase1.domain.ports.in.IPedidoProdutoUseCasePort;
import aplbackfase1.domain.ports.in.IPedidoUseCasePort;
import aplbackfase1.domain.ports.out.IPedidoProdutoRepositoryPort;
import aplbackfase1.domain.ports.out.IPedidoRepositoryPort;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PedidoProdutoUseCaseImpl implements IPedidoProdutoUseCasePort {

    private final IPedidoRepositoryPort pedidoRepositoryPort;
    private final IPedidoProdutoRepositoryPort pedidoProdutoRepositoryPort;

    @Override
    public Optional<PedidoProduto> buscarPorId(UUID id) {
        return pedidoProdutoRepositoryPort.buscarPorId(id);
    }

    @Override
    public Optional<PedidoProduto> buscarIdPedido(UUID idPedido) {
        return pedidoProdutoRepositoryPort.buscarPorId(idPedido);
    }

    @Override
    public PedidoProduto adicionarPedidoProduto(PedidoProduto pedidoProduto) {
        checkPedidoStatus(pedidoProduto.getPedidoId());
        return pedidoProdutoRepositoryPort.adicionarPedidoProduto(pedidoProduto);
    }
    @Override
    public PedidoProduto editarPedidoProduto(PedidoProduto pedidoProduto) {
        checkPedidoStatus(pedidoProduto.getPedidoId());
        return pedidoProdutoRepositoryPort.editarPedidoProduto(pedidoProduto);
    }

    @Override
    public void deletarPedidoProduto(UUID id) {
        pedidoProdutoRepositoryPort.deletar(id);
    }

    private Pedido checkPedidoStatus(UUID idPedido) {
        Optional<Pedido> optionalPedido = pedidoRepositoryPort.buscarPorId(idPedido);
        if (optionalPedido.isPresent()) {
            Pedido existingPedido = optionalPedido.get();
            if (existingPedido.getStatusPedido() == StatusPedido.A) {
                return existingPedido;
            } else {
                throw new IllegalStateException("Pedido não está aberto para edição.");
            }
        } else {
            throw new IllegalStateException("Pedido não encontrado.");
        }
    }

}
