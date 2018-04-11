package com.dcxy.getPaper;

import java.util.ArrayList;
import java.util.List;

import com.dcxy.data.Item;

public class GetPaper {
	
	/**
	 * 返回所有分页产品
	 * @return
	 */
	public static List<List<Item>> allPaper(List<Item> product){
		List<List<Item>> store=new ArrayList<List<Item>>();
		int i ;int j;
		for(i=0;i<product.size()-(5-product.size()%5);i+=5){
			List<Item> list=new ArrayList<Item>();
			for(j=i;j<i+5;j++){
				if(product.size()>j)
				list.add(product.get(j));
				else break;
			}
			store.add(list);
			
			
		}
		return store;
	}
	
	/*public static List<Item> paper( List<List<Item>>store,int s){
		if(store.size()>s &&s>=0){
			return store.get(s);
			
		}else return null;
	}*/
public static void main(String[] args) {
/*	List<List<Item>> a = allPaper();
	if(a!=null)
	System.out.println(a.size());
	
	for(int i = 0 ;i<a.size();i++){
		System.out.println("这是第"+i+"页");
		for(int j=0; j<a.get(i).size();j++)
		System.out.println(a.get(i).get(j).getName());
	}*/
}
}
