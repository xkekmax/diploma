PGDMP                     
    |            diploma    14.9    14.9 v    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18878    diploma    DATABASE     k   CREATE DATABASE diploma WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE diploma;
                postgres    false            �            1259    18988    admins    TABLE     �  CREATE TABLE public.admins (
    id_admin integer NOT NULL,
    surname_admin character varying(50) NOT NULL,
    firstname_admin character varying(50) NOT NULL,
    patronymic_admin character varying(50),
    date_of_birthday date,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    id_role integer NOT NULL
);
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    18987    admins_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.admins_id_admin_seq;
       public          postgres    false    228            �           0    0    admins_id_admin_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;
          public          postgres    false    227            �            1259    18880    authors    TABLE     �   CREATE TABLE public.authors (
    id_author integer NOT NULL,
    surname_author character varying(50) NOT NULL,
    firstname_author character varying(50) NOT NULL,
    patronymic_author character varying(50)
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    18879    authors_id_author_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_id_author_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.authors_id_author_seq;
       public          postgres    false    210            �           0    0    authors_id_author_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.authors_id_author_seq OWNED BY public.authors.id_author;
          public          postgres    false    209            �            1259    19150    books    TABLE     �  CREATE TABLE public.books (
    code_book integer NOT NULL,
    book_name character varying(200) NOT NULL,
    id_author integer NOT NULL,
    id_translator integer NOT NULL,
    id_illustrator integer NOT NULL,
    id_publishing integer NOT NULL,
    id_series integer NOT NULL,
    id_cover integer NOT NULL,
    id_paper integer NOT NULL,
    id_section integer NOT NULL,
    page_count integer NOT NULL,
    year_of_publication date NOT NULL,
    book_size character varying(20) NOT NULL,
    book_weight character varying(20) NOT NULL,
    "ISBN" character varying NOT NULL,
    cover_art character varying NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    19149    books_code_book_seq    SEQUENCE     �   CREATE SEQUENCE public.books_code_book_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.books_code_book_seq;
       public          postgres    false    237            �           0    0    books_code_book_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.books_code_book_seq OWNED BY public.books.code_book;
          public          postgres    false    236            �            1259    18915    covers    TABLE     n   CREATE TABLE public.covers (
    id_cover integer NOT NULL,
    cover_name character varying(200) NOT NULL
);
    DROP TABLE public.covers;
       public         heap    postgres    false            �            1259    18914    covers_id_cover_seq    SEQUENCE     �   CREATE SEQUENCE public.covers_id_cover_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.covers_id_cover_seq;
       public          postgres    false    220            �           0    0    covers_id_cover_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.covers_id_cover_seq OWNED BY public.covers.id_cover;
          public          postgres    false    219            �            1259    19000 	   customers    TABLE     �  CREATE TABLE public.customers (
    id_customer integer NOT NULL,
    surname_customer character varying(50) NOT NULL,
    firstname_customer character varying(50) NOT NULL,
    patronymic_customer character varying(50),
    date_of_birthday date,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(50),
    card_number character varying(50),
    id_role integer NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    18999    customers_id_customer_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_id_customer_seq;
       public          postgres    false    230            �           0    0    customers_id_customer_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_id_customer_seq OWNED BY public.customers.id_customer;
          public          postgres    false    229            �            1259    19012    form_of_payment    TABLE     {   CREATE TABLE public.form_of_payment (
    id_payment integer NOT NULL,
    payment_name character varying(200) NOT NULL
);
 #   DROP TABLE public.form_of_payment;
       public         heap    postgres    false            �            1259    19011    form_of_payment_id_payment_seq    SEQUENCE     �   CREATE SEQUENCE public.form_of_payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.form_of_payment_id_payment_seq;
       public          postgres    false    232            �           0    0    form_of_payment_id_payment_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.form_of_payment_id_payment_seq OWNED BY public.form_of_payment.id_payment;
          public          postgres    false    231            �            1259    18894    illustrators    TABLE     �   CREATE TABLE public.illustrators (
    id_illustrator integer NOT NULL,
    surname_illustrator character varying(50) NOT NULL,
    firstname_illustrator character varying(50) NOT NULL,
    patronymic_illustrator character varying(50)
);
     DROP TABLE public.illustrators;
       public         heap    postgres    false            �            1259    18893    illustrators_id_illustrator_seq    SEQUENCE     �   CREATE SEQUENCE public.illustrators_id_illustrator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.illustrators_id_illustrator_seq;
       public          postgres    false    214            �           0    0    illustrators_id_illustrator_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.illustrators_id_illustrator_seq OWNED BY public.illustrators.id_illustrator;
          public          postgres    false    213            �            1259    19019    orders    TABLE     �   CREATE TABLE public.orders (
    id_order integer NOT NULL,
    id_customer integer NOT NULL,
    id_payment integer NOT NULL,
    order_date date NOT NULL,
    delivery_date date NOT NULL,
    delivery_address character varying(200) NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    19018    orders_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_id_order_seq;
       public          postgres    false    234            �           0    0    orders_id_order_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_id_order_seq OWNED BY public.orders.id_order;
          public          postgres    false    233            �            1259    18901 
   publishing    TABLE     |   CREATE TABLE public.publishing (
    id_publishing integer NOT NULL,
    publishing_name character varying(200) NOT NULL
);
    DROP TABLE public.publishing;
       public         heap    postgres    false            �            1259    18900    publishing_id_publishing_seq    SEQUENCE     �   CREATE SEQUENCE public.publishing_id_publishing_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.publishing_id_publishing_seq;
       public          postgres    false    216            �           0    0    publishing_id_publishing_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.publishing_id_publishing_seq OWNED BY public.publishing.id_publishing;
          public          postgres    false    215            �            1259    18981    roles    TABLE     k   CREATE TABLE public.roles (
    id_role integer NOT NULL,
    role_name character varying(200) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    18980    roles_id_role_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_id_role_seq;
       public          postgres    false    226            �           0    0    roles_id_role_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_id_role_seq OWNED BY public.roles.id_role;
          public          postgres    false    225            �            1259    18929    sections    TABLE     t   CREATE TABLE public.sections (
    id_section integer NOT NULL,
    section_name character varying(200) NOT NULL
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    18928    sections_id_section_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_id_section_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sections_id_section_seq;
       public          postgres    false    224            �           0    0    sections_id_section_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sections_id_section_seq OWNED BY public.sections.id_section;
          public          postgres    false    223            �            1259    18908    series    TABLE     p   CREATE TABLE public.series (
    id_series integer NOT NULL,
    series_name character varying(200) NOT NULL
);
    DROP TABLE public.series;
       public         heap    postgres    false            �            1259    18907    series_id_series_seq    SEQUENCE     �   CREATE SEQUENCE public.series_id_series_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.series_id_series_seq;
       public          postgres    false    218            �           0    0    series_id_series_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.series_id_series_seq OWNED BY public.series.id_series;
          public          postgres    false    217            �            1259    19035    shopping_cart    TABLE     �   CREATE TABLE public.shopping_cart (
    id_order integer NOT NULL,
    code_book integer NOT NULL,
    the_number_of_copies integer NOT NULL
);
 !   DROP TABLE public.shopping_cart;
       public         heap    postgres    false            �            1259    18887    translators    TABLE     �   CREATE TABLE public.translators (
    id_translator integer NOT NULL,
    surname_translator character varying(50) NOT NULL,
    firstname_translator character varying(50) NOT NULL,
    patronymic_translator character varying(50)
);
    DROP TABLE public.translators;
       public         heap    postgres    false            �            1259    18886    translators_id_translator_seq    SEQUENCE     �   CREATE SEQUENCE public.translators_id_translator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.translators_id_translator_seq;
       public          postgres    false    212            �           0    0    translators_id_translator_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.translators_id_translator_seq OWNED BY public.translators.id_translator;
          public          postgres    false    211            �            1259    18922    type_of_paper    TABLE     u   CREATE TABLE public.type_of_paper (
    id_paper integer NOT NULL,
    paper_name character varying(200) NOT NULL
);
 !   DROP TABLE public.type_of_paper;
       public         heap    postgres    false            �            1259    18921    type_of_paper_id_paper_seq    SEQUENCE     �   CREATE SEQUENCE public.type_of_paper_id_paper_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.type_of_paper_id_paper_seq;
       public          postgres    false    222            �           0    0    type_of_paper_id_paper_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.type_of_paper_id_paper_seq OWNED BY public.type_of_paper.id_paper;
          public          postgres    false    221            �           2604    18991    admins id_admin    DEFAULT     r   ALTER TABLE ONLY public.admins ALTER COLUMN id_admin SET DEFAULT nextval('public.admins_id_admin_seq'::regclass);
 >   ALTER TABLE public.admins ALTER COLUMN id_admin DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    18883    authors id_author    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN id_author SET DEFAULT nextval('public.authors_id_author_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN id_author DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    19153    books code_book    DEFAULT     r   ALTER TABLE ONLY public.books ALTER COLUMN code_book SET DEFAULT nextval('public.books_code_book_seq'::regclass);
 >   ALTER TABLE public.books ALTER COLUMN code_book DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    18918    covers id_cover    DEFAULT     r   ALTER TABLE ONLY public.covers ALTER COLUMN id_cover SET DEFAULT nextval('public.covers_id_cover_seq'::regclass);
 >   ALTER TABLE public.covers ALTER COLUMN id_cover DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    19003    customers id_customer    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN id_customer DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    19015    form_of_payment id_payment    DEFAULT     �   ALTER TABLE ONLY public.form_of_payment ALTER COLUMN id_payment SET DEFAULT nextval('public.form_of_payment_id_payment_seq'::regclass);
 I   ALTER TABLE public.form_of_payment ALTER COLUMN id_payment DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    18897    illustrators id_illustrator    DEFAULT     �   ALTER TABLE ONLY public.illustrators ALTER COLUMN id_illustrator SET DEFAULT nextval('public.illustrators_id_illustrator_seq'::regclass);
 J   ALTER TABLE public.illustrators ALTER COLUMN id_illustrator DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    19022    orders id_order    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN id_order SET DEFAULT nextval('public.orders_id_order_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN id_order DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    18904    publishing id_publishing    DEFAULT     �   ALTER TABLE ONLY public.publishing ALTER COLUMN id_publishing SET DEFAULT nextval('public.publishing_id_publishing_seq'::regclass);
 G   ALTER TABLE public.publishing ALTER COLUMN id_publishing DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    18984    roles id_role    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN id_role SET DEFAULT nextval('public.roles_id_role_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    18932    sections id_section    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN id_section SET DEFAULT nextval('public.sections_id_section_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN id_section DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    18911    series id_series    DEFAULT     t   ALTER TABLE ONLY public.series ALTER COLUMN id_series SET DEFAULT nextval('public.series_id_series_seq'::regclass);
 ?   ALTER TABLE public.series ALTER COLUMN id_series DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    18890    translators id_translator    DEFAULT     �   ALTER TABLE ONLY public.translators ALTER COLUMN id_translator SET DEFAULT nextval('public.translators_id_translator_seq'::regclass);
 H   ALTER TABLE public.translators ALTER COLUMN id_translator DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    18925    type_of_paper id_paper    DEFAULT     �   ALTER TABLE ONLY public.type_of_paper ALTER COLUMN id_paper SET DEFAULT nextval('public.type_of_paper_id_paper_seq'::regclass);
 E   ALTER TABLE public.type_of_paper ALTER COLUMN id_paper DROP DEFAULT;
       public          postgres    false    221    222    222            w          0    18988    admins 
   TABLE DATA           �   COPY public.admins (id_admin, surname_admin, firstname_admin, patronymic_admin, date_of_birthday, login, password, email, id_role) FROM stdin;
    public          postgres    false    228   ��       e          0    18880    authors 
   TABLE DATA           a   COPY public.authors (id_author, surname_author, firstname_author, patronymic_author) FROM stdin;
    public          postgres    false    210   �       �          0    19150    books 
   TABLE DATA           �   COPY public.books (code_book, book_name, id_author, id_translator, id_illustrator, id_publishing, id_series, id_cover, id_paper, id_section, page_count, year_of_publication, book_size, book_weight, "ISBN", cover_art, price) FROM stdin;
    public          postgres    false    237   ��       o          0    18915    covers 
   TABLE DATA           6   COPY public.covers (id_cover, cover_name) FROM stdin;
    public          postgres    false    220   �       y          0    19000 	   customers 
   TABLE DATA           �   COPY public.customers (id_customer, surname_customer, firstname_customer, patronymic_customer, date_of_birthday, login, password, email, phone, card_number, id_role) FROM stdin;
    public          postgres    false    230   5�       {          0    19012    form_of_payment 
   TABLE DATA           C   COPY public.form_of_payment (id_payment, payment_name) FROM stdin;
    public          postgres    false    232   R�       i          0    18894    illustrators 
   TABLE DATA           z   COPY public.illustrators (id_illustrator, surname_illustrator, firstname_illustrator, patronymic_illustrator) FROM stdin;
    public          postgres    false    214   ��       }          0    19019    orders 
   TABLE DATA           p   COPY public.orders (id_order, id_customer, id_payment, order_date, delivery_date, delivery_address) FROM stdin;
    public          postgres    false    234   �       k          0    18901 
   publishing 
   TABLE DATA           D   COPY public.publishing (id_publishing, publishing_name) FROM stdin;
    public          postgres    false    216    �       u          0    18981    roles 
   TABLE DATA           3   COPY public.roles (id_role, role_name) FROM stdin;
    public          postgres    false    226   g�       s          0    18929    sections 
   TABLE DATA           <   COPY public.sections (id_section, section_name) FROM stdin;
    public          postgres    false    224   ��       m          0    18908    series 
   TABLE DATA           8   COPY public.series (id_series, series_name) FROM stdin;
    public          postgres    false    218   ѓ       ~          0    19035    shopping_cart 
   TABLE DATA           R   COPY public.shopping_cart (id_order, code_book, the_number_of_copies) FROM stdin;
    public          postgres    false    235   ��       g          0    18887    translators 
   TABLE DATA           u   COPY public.translators (id_translator, surname_translator, firstname_translator, patronymic_translator) FROM stdin;
    public          postgres    false    212   ��       q          0    18922    type_of_paper 
   TABLE DATA           =   COPY public.type_of_paper (id_paper, paper_name) FROM stdin;
    public          postgres    false    222   5�       �           0    0    admins_id_admin_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.admins_id_admin_seq', 1, false);
          public          postgres    false    227            �           0    0    authors_id_author_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.authors_id_author_seq', 5, true);
          public          postgres    false    209            �           0    0    books_code_book_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.books_code_book_seq', 10, true);
          public          postgres    false    236            �           0    0    covers_id_cover_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.covers_id_cover_seq', 2, true);
          public          postgres    false    219            �           0    0    customers_id_customer_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_id_customer_seq', 1, false);
          public          postgres    false    229            �           0    0    form_of_payment_id_payment_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.form_of_payment_id_payment_seq', 2, true);
          public          postgres    false    231            �           0    0    illustrators_id_illustrator_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.illustrators_id_illustrator_seq', 1, true);
          public          postgres    false    213            �           0    0    orders_id_order_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_id_order_seq', 1, false);
          public          postgres    false    233            �           0    0    publishing_id_publishing_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.publishing_id_publishing_seq', 3, true);
          public          postgres    false    215            �           0    0    roles_id_role_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_id_role_seq', 1, false);
          public          postgres    false    225            �           0    0    sections_id_section_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_id_section_seq', 3, true);
          public          postgres    false    223            �           0    0    series_id_series_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.series_id_series_seq', 4, true);
          public          postgres    false    217            �           0    0    translators_id_translator_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.translators_id_translator_seq', 4, true);
          public          postgres    false    211            �           0    0    type_of_paper_id_paper_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.type_of_paper_id_paper_seq', 2, true);
          public          postgres    false    221            �           2606    18993    admins admins_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    228            �           2606    18885    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id_author);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    210            �           2606    19157    books books_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (code_book);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    237            �           2606    18920    covers covers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.covers
    ADD CONSTRAINT covers_pkey PRIMARY KEY (id_cover);
 <   ALTER TABLE ONLY public.covers DROP CONSTRAINT covers_pkey;
       public            postgres    false    220            �           2606    19005    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    230            �           2606    19017 $   form_of_payment form_of_payment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.form_of_payment
    ADD CONSTRAINT form_of_payment_pkey PRIMARY KEY (id_payment);
 N   ALTER TABLE ONLY public.form_of_payment DROP CONSTRAINT form_of_payment_pkey;
       public            postgres    false    232            �           2606    18899    illustrators illustrators_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.illustrators
    ADD CONSTRAINT illustrators_pkey PRIMARY KEY (id_illustrator);
 H   ALTER TABLE ONLY public.illustrators DROP CONSTRAINT illustrators_pkey;
       public            postgres    false    214            �           2606    19024    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    234            �           2606    18906    publishing publishing_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.publishing
    ADD CONSTRAINT publishing_pkey PRIMARY KEY (id_publishing);
 D   ALTER TABLE ONLY public.publishing DROP CONSTRAINT publishing_pkey;
       public            postgres    false    216            �           2606    18986    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_role);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    226            �           2606    18934    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id_section);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    224            �           2606    18913    series series_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id_series);
 <   ALTER TABLE ONLY public.series DROP CONSTRAINT series_pkey;
       public            postgres    false    218            �           2606    18892    translators translators_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.translators
    ADD CONSTRAINT translators_pkey PRIMARY KEY (id_translator);
 F   ALTER TABLE ONLY public.translators DROP CONSTRAINT translators_pkey;
       public            postgres    false    212            �           2606    18927     type_of_paper type_of_paper_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.type_of_paper
    ADD CONSTRAINT type_of_paper_pkey PRIMARY KEY (id_paper);
 J   ALTER TABLE ONLY public.type_of_paper DROP CONSTRAINT type_of_paper_pkey;
       public            postgres    false    222            �           2606    18994    admins admins_id_role_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id_role);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_id_role_fkey;
       public          postgres    false    228    3264    226            �           2606    19158    books books_id_author_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_author_fkey FOREIGN KEY (id_author) REFERENCES public.authors(id_author);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_author_fkey;
       public          postgres    false    237    210    3248            �           2606    19183    books books_id_cover_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_cover_fkey FOREIGN KEY (id_cover) REFERENCES public.covers(id_cover);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_cover_fkey;
       public          postgres    false    237    220    3258            �           2606    19168    books books_id_illustrator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_illustrator_fkey FOREIGN KEY (id_illustrator) REFERENCES public.illustrators(id_illustrator);
 I   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_illustrator_fkey;
       public          postgres    false    214    237    3252            �           2606    19188    books books_id_paper_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_paper_fkey FOREIGN KEY (id_paper) REFERENCES public.type_of_paper(id_paper);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_paper_fkey;
       public          postgres    false    237    222    3260            �           2606    19173    books books_id_publishing_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_publishing_fkey FOREIGN KEY (id_publishing) REFERENCES public.publishing(id_publishing);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_publishing_fkey;
       public          postgres    false    3254    237    216            �           2606    19193    books books_id_section_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_section_fkey FOREIGN KEY (id_section) REFERENCES public.sections(id_section);
 E   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_section_fkey;
       public          postgres    false    237    224    3262            �           2606    19178    books books_id_series_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_series_fkey FOREIGN KEY (id_series) REFERENCES public.series(id_series);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_series_fkey;
       public          postgres    false    3256    218    237            �           2606    19163    books books_id_translator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_translator_fkey FOREIGN KEY (id_translator) REFERENCES public.translators(id_translator);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_translator_fkey;
       public          postgres    false    3250    237    212            �           2606    19006     customers customers_id_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id_role);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_id_role_fkey;
       public          postgres    false    226    230    3264            �           2606    19025    orders orders_id_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customers(id_customer);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_customer_fkey;
       public          postgres    false    234    230    3268            �           2606    19030    orders orders_id_payment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_payment_fkey FOREIGN KEY (id_payment) REFERENCES public.form_of_payment(id_payment);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_payment_fkey;
       public          postgres    false    232    3270    234            �           2606    19198 *   shopping_cart shopping_cart_code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_code_book_fkey FOREIGN KEY (code_book) REFERENCES public.books(code_book) NOT VALID;
 T   ALTER TABLE ONLY public.shopping_cart DROP CONSTRAINT shopping_cart_code_book_fkey;
       public          postgres    false    235    237    3274            �           2606    19038 )   shopping_cart shopping_cart_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id_order);
 S   ALTER TABLE ONLY public.shopping_cart DROP CONSTRAINT shopping_cart_id_order_fkey;
       public          postgres    false    3272    235    234            w      x������ � �      e   �   x�UN��@�g�pH��b8( dF ���lZ��9H@�v�]�GF���w؂gN`%x͔�/|�JR�f#���&[eK�[b}������	���ԉ������ț�{ɺ?l��]��C!2������33{[{x      �   '  x����n1��ާ�z�����,9qA�C�x�� "(H�
�ר钐d�/0~#��.�ꍴH(�����g��pf��%l�Q��p�x�k
?p���6PA�~V�ɥd\��[z�'���T�R��U��"���0����g���d����GOڅ����Dh�
�C~�:L�5��r.a�0�=b�y�i�(Lw��W�˪AJ�R�T9��;�U���va�����W�:�� ���9�w��p��#�);�dp�{�� ���̰nux�2E`������We��+��L�V��E�^@�>F�����dxZ�3��ymX#�Ԇ��\��H�z^!�&<�%�K��E]f�F�Q�U��V��t-�Ӳ�9��h9�iCa�*d��Տ�r�nF{�� ��]Wx��3��78�4.�!h�p�w6x~]R����>��������E+����6���	���pd
Jv^�]P�4}Ph�.(u7(��6��W��U��_����0ؠ�
O��2�5�p�7��u�9���3?��y�vJ��(�߿ܔ      o   <   x�3估�¦�/6\�r���N��/lr���@�&.#�s.�_�|aׅ��c���� r�+�      y      x������ � �      {   P   x�3�0�bÅ
�_�wa�����^�{aHh��v1��2�0�����v* �lP����	������ �!/m      i   A   x�3�0���{/�بpa�}.l
l��	I��d4ew���v.#�x ������� ��*[      }      x������ � �      k   7   x�, ��1	АСТ
2	Эксмо
3	Лайвбук
\.


%��      u      x������ � �      s   =   x�3�0�bÅ}�_��e�yaɅ�^l���b#��qaP�(|�,��nW� �!�      m   �   x�%M;
�P�ߞb/`��r�D$E�
V>�2��B� ��IL�0{#��bv�33�6#�dx��X_Q+J��8�B���!Ǜ�2N�����6�/��H]�����+M����ө����$+�o�$E	G=���4	�?�[ã$^D�y0β���U�2�>�i/��0 �u4w�      ~      x������ � �      g   |   x����@D��b�B(�b�\#���6�	[ø�{�o�}`5�����o��� �8i��v�U��;f���̯��W�>�QV.~����[������e���t�O�����4�e�      q   7   x�3�0�b���[/6]�{a��~.#��.츰�¾�/6 �@һ�R1z\\\ 5�     