/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.um.mateo.inscripciones.service.impl;

import java.math.BigDecimal;
import java.util.Map;
import mx.edu.um.mateo.general.dao.BaseDao;
import mx.edu.um.mateo.general.model.Usuario;
import mx.edu.um.mateo.inscripciones.dao.AFEConvenioDao;
import mx.edu.um.mateo.inscripciones.dao.AlumnoDao;
import mx.edu.um.mateo.inscripciones.dao.TiposBecasDao;
import mx.edu.um.mateo.inscripciones.model.AFEConvenio;
import mx.edu.um.mateo.inscripciones.model.Alumno;
import mx.edu.um.mateo.inscripciones.service.AFEConvenioManager;
import mx.edu.um.mateo.inscripciones.utils.MatriculaInvalidaException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author zorch
 */
@Transactional
@Service
public class AFEConvenioManagerImpl extends BaseDao implements AFEConvenioManager{
    
    @Autowired
    private AFEConvenioDao dao;
    @Autowired
    private TiposBecasDao tiposDao;

    @Autowired
    private AlumnoDao alDao;
    public AFEConvenioManagerImpl(){
    
    }
    
    @Override
    public Map<String, Object> lista(Map<String, Object> params) {
        return dao.lista(params);
    }
    

    
    @Override
    public AFEConvenio obtiene(Long id) {
       return dao.obtiene(new Long(id));
    }

    @Override
    public void graba(AFEConvenio afeConvenio, Usuario usuario)throws MatriculaInvalidaException{
       if(alDao.obtiene(afeConvenio.getMatricula())!= null){
           afeConvenio.setTipoBeca(tiposDao.obtiene("Servicio Becario"));
           afeConvenio.setDiezma(afeConvenio.getTipoBeca().getDiezma());
           afeConvenio.setNumHoras(afeConvenio.getTipoBeca().getNumHoras());
           afeConvenio.setStatus(afeConvenio.getTipoBeca().getStatus());
            afeConvenio.setImporte(BigDecimal.ZERO);
           dao.graba(afeConvenio, usuario);
           
       }else{
           throw new MatriculaInvalidaException() ;
       }
    }
    
    @Override
    public String elimina( Long id) {
         return dao.elimina(id);
       
    }
    
    @Override
    public AFEConvenio asignarConvenio(AFEConvenio afeConvenio) throws MatriculaInvalidaException{
        
            Alumno alumno = alDao.obtiene(afeConvenio.getMatricula());
            
            if(alumno == null){
                throw new MatriculaInvalidaException();
            }
            
            afeConvenio.setAlumno(alumno);
        
       return afeConvenio;
    }
}
