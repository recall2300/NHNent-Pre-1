package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{

	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;
      
    
    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectBoardList(map);
    }
    
    @Override
    public void insertBoard(Map<String, Object> map) throws Exception {
        sampleDAO.insertBoard(map);
    }
    
    @Override
    public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
        Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map);
        return resultMap;
    }
    
    @SuppressWarnings("unchecked")
	@Override
    public boolean updateBoard(Map<String, Object> map) throws Exception{
    	Map<String, Object> tempMap = (Map<String,Object>) sampleDAO.selectOne("selectBoardOne", map);
    	
    	if(map.get("idx").toString().equals(tempMap.get("idx").toString())){
    		if(map.get("pass").toString().equals(tempMap.get("pass").toString())){
    			sampleDAO.updateBoard(map);
    			return true;
    		}
    	}
    	return false;
    }

    @Override
    public void deleteBoard(Map<String, Object> map) throws Exception {
        sampleDAO.deleteBoard(map);
    }

}
