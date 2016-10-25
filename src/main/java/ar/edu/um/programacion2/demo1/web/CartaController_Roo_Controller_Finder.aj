// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.demo1.web;

import ar.edu.um.programacion2.demo1.entidades.Carta;
import ar.edu.um.programacion2.demo1.web.CartaController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect CartaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByNumeroIsNull", "form" }, method = RequestMethod.GET)
    public String CartaController.findCartasByNumeroIsNullForm() {
        return "cartas/findCartasByNumeroIsNull";
    }
    
    @RequestMapping(params = "find=ByNumeroIsNull", method = RequestMethod.GET)
    public String CartaController.findCartasByNumeroIsNull(Model uiModel) {
        uiModel.addAttribute("cartas", Carta.findCartasByNumeroIsNull().getResultList());
        return "cartas/list";
    }
    
    @RequestMapping(params = { "find=ByPaloLike", "form" }, method = RequestMethod.GET)
    public String CartaController.findCartasByPaloLikeForm(Model uiModel) {
        return "cartas/findCartasByPaloLike";
    }
    
    @RequestMapping(params = "find=ByPaloLike", method = RequestMethod.GET)
    public String CartaController.findCartasByPaloLike(@RequestParam("palo") String palo, Model uiModel) {
        uiModel.addAttribute("cartas", Carta.findCartasByPaloLike(palo).getResultList());
        return "cartas/list";
    }
    
}
