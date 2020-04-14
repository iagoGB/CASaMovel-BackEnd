package br.com.casamovel.endpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import br.com.casamovel.dto.evento.DetalhesEventoDTO;
import br.com.casamovel.dto.evento.NovoEventoDTO;
import br.com.casamovel.model.Evento;
import br.com.casamovel.service.EventoService;
import java.util.List;

import javax.xml.ws.Response;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/evento")
public class EventoEndpoint {
    @Autowired
    EventoService es;

    @GetMapping
    public List<DetalhesEventoDTO> getAll() {
        return es.listarEventos();
    }
    
    @GetMapping("/{id}")
    public DetalhesEventoDTO findById(@PathVariable(value="id") final Long id) {
    	return es.findById(id);
    }

    @PostMapping
    public ResponseEntity<DetalhesEventoDTO> salvaEvento(
    		@RequestBody final NovoEventoDTO evento,
    		final UriComponentsBuilder uriBuilder
    ) 
    {
    	final Evento salvarEvento = es.salvarEvento(evento);
        if (salvarEvento != null ) {
        	final DetalhesEventoDTO parse = DetalhesEventoDTO.parse(salvarEvento);
            return ResponseEntity.status(HttpStatus.CREATED).body(parse);
        } else {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deletaEvento(@PathVariable(value = "id") long id) {
        if (es.deletarEvento(id)) {
            return ResponseEntity.status(HttpStatus.OK).body("Evento excluido!");
        } else {
            return ResponseEntity.badRequest().body("Erro ao excluir evento");
        }
    }

    @PostMapping("/{id}/inscricao/")
    public ResponseEntity<?> inscreverEmEvento
    (
        @PathVariable(value ="id") Long id, 
        @RequestParam String usermail
    )
    {
        System.out.println("id "+id);
        System.out.println("nome do usuário: "+usermail);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
