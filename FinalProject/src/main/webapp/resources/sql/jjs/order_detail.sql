drop table order_detail  cascade constraints;

CREATE TABLE ORDER_DETAIL(
  ORDER_DE_NUM       VARCHAR2(15)	not null,   -- 주문상세번호 
  ORDER_NUM          VARCHAR2(50)	not null,   -- 주문번호 
  ORDER_DE_COUNT	 NUMBER(3)      not null,   -- 주문수량 
  PRODUCT_CODE       VARCHAR2(6)    not null,   -- 상품코드 
  CATEGORY_CODE      VARCHAR2(50)	not null,   -- 카테고리 코드 
  PRODUCT_NAME       VARCHAR2(50)	not null,   -- 상품명 
  PRODUCT_PRICE   	 NUMBER(10)		not null,   -- 상품 가격 
  PRODUCT_DETAIL     VARCHAR2(100)	not null,   -- 상세 정보 
  PRODUCT_IMG        VARCHAR2(50)	not null,   -- 실제 저장된 이미지이름 
  PRODUCT_ORIGINAL   VARCHAR2(50)	not null,   -- 첨부될 파일 명
  PRIMARY KEY(ORDER_DE_NUM),
  FOREIGN KEY (ORDER_NUM) REFERENCES ORDER_MARKET (ORDER_NUM)
);

delete from ORDER_DETAIL;

select * 
from order_detail o, category c
where o.category_code = c.category_code;

create sequence order_detail_seq;

drop sequence order_detail_seq;

insert into order_detail
values(order_detail_seq.nextval, '210924_332142', '000001', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332142', '000002', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332142', '000003', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332143', '000002', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332144', '000003', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332145', '000004', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332146', '000005', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332147', '000006', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332148', '000007', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332149', '000008', 3);

insert into order_detail
values(order_detail_seq.nextval, '210924_332150', '000001', 3);

select p.product_code, p.category_code, c.category_name, p.product_name, p.product_price,
	  	   		  		   p.product_detail, p.product_img, p.product_original, p.product_date
	  	   			from product p, CATEGORY c ,order_detail o
	  	   			where p.category_code = c.category_code
	  	   		    and   p.PRODUCT_CODE = o.PRODUCT_CODE
	  	   			order by o.ORDER_DE_COUNT
	  	   			,p.product_code