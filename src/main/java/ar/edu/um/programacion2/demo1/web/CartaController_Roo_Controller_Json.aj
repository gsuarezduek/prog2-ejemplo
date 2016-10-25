// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.demo1.web;

import ar.edu.um.programacion2.demo1.entidades.Carta;
import ar.edu.um.programacion2.demo1.web.CartaController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect CartaController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CartaController.showJson(@PathVariable("id") Long id) {
        Carta carta = Carta.findCarta(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (carta == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(carta.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CartaController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Carta> result = Carta.findAllCartas();
        return new ResponseEntity<String>(Carta.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CartaController.createFromJson(@RequestBody String json) {
        Carta carta = Carta.fromJsonToCarta(json);
        carta.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CartaController.createFromJsonArray(@RequestBody String json) {
        for (Carta carta: Carta.fromJsonArrayToCartas(json)) {
            carta.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CartaController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Carta carta = Carta.fromJsonToCarta(json);
        if (carta.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CartaController.deleteFromJson(@PathVariable("id") Long id) {
        Carta carta = Carta.findCarta(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (carta == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        carta.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByNumeroIsNull", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CartaController.jsonFindCartasByNumeroIsNull() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Carta.toJsonArray(Carta.findCartasByNumeroIsNull().getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByPaloLike", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CartaController.jsonFindCartasByPaloLike(@RequestParam("palo") String palo) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Carta.toJsonArray(Carta.findCartasByPaloLike(palo).getResultList()), headers, HttpStatus.OK);
    }
    
}
