package com.homework.modal;

import com.homework.domain.Item;

import java.util.ArrayList;
import java.util.List;


public class ItemService {
    public List<Item> getItems(){
        List<Item> items=new ArrayList<Item>();
        items.add(new Item(1,"Table",12.99));
        items.add(new Item(2,"Chair",8.99));
        items.add(new Item(3,"Cabinet",30.99));
        return items;
    }
}
