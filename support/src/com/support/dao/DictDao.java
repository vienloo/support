package com.support.dao;

import java.util.List;
import java.util.Map;

import com.support.model.Dict;



public interface DictDao {

	int getAllRecords_dictType(Map<String, Object> map);

	List<Map<String, Object>> getAll_dictType(Map<String, Object> map);

	int addDictType(Dict dict);

	int updateDictType(Dict dict);

	int removeDictType(Dict dict);

	int getAllRecords_dictItem(Map<String, Object> map);

	List<Map<String, Object>> getAll_dictItem(Map<String, Object> map);

	int addDictItem(Dict dict);

	int updateDictItem(Dict dict);

	int removeDictItem(Dict dict);

}
