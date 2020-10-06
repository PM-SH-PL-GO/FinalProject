package com.shallwe.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardPageBean<T> {
   public static final int CNT_PER_PAGE =10;
   private String url = "";
   private int currentPage;
   private int startRow;
   private int endRow;
   private int totalPage;
   private int startPage;
   private int endPage;
   private List<T> list;
   
   public BoardPageBean(int currentPage) {
      this.currentPage = currentPage;
      this.endRow = currentPage * CNT_PER_PAGE;
      this.startRow = endRow - CNT_PER_PAGE + 1;   
   }
}
