PGDMP                         }            diploma    14.9    14.9 ~    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18878    diploma    DATABASE     k   CREATE DATABASE diploma WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE diploma;
                postgres    false            �            1259    21936    admins    TABLE     �  CREATE TABLE public.admins (
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
       public         heap    postgres    false            �            1259    21935    admins_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.admins_id_admin_seq;
       public          postgres    false    237            �           0    0    admins_id_admin_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;
          public          postgres    false    236            �            1259    18880    authors    TABLE     p   CREATE TABLE public.authors (
    id_author integer NOT NULL,
    name_author character varying(50) NOT NULL
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
    book_size character varying(50) NOT NULL,
    book_weight character varying(20) NOT NULL,
    "ISBN" character varying NOT NULL,
    cover_art character varying NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL
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
       public          postgres    false    230            �           0    0    books_code_book_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.books_code_book_seq OWNED BY public.books.code_book;
          public          postgres    false    229            �            1259    18915    covers    TABLE     n   CREATE TABLE public.covers (
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
       public          postgres    false    228            �           0    0    customers_id_customer_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_id_customer_seq OWNED BY public.customers.id_customer;
          public          postgres    false    227            �            1259    19410 	   favorites    TABLE     �   CREATE TABLE public.favorites (
    id_fav integer NOT NULL,
    code_book integer NOT NULL,
    id_customer integer NOT NULL
);
    DROP TABLE public.favorites;
       public         heap    postgres    false            �            1259    19409    favorites_id_fav_seq    SEQUENCE     �   CREATE SEQUENCE public.favorites_id_fav_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.favorites_id_fav_seq;
       public          postgres    false    232            �           0    0    favorites_id_fav_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.favorites_id_fav_seq OWNED BY public.favorites.id_fav;
          public          postgres    false    231            �            1259    21948    form_of_payment    TABLE     {   CREATE TABLE public.form_of_payment (
    id_payment integer NOT NULL,
    payment_name character varying(200) NOT NULL
);
 #   DROP TABLE public.form_of_payment;
       public         heap    postgres    false            �            1259    21951    form_of_payment_id_payment_seq    SEQUENCE     �   CREATE SEQUENCE public.form_of_payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.form_of_payment_id_payment_seq;
       public          postgres    false    238            �           0    0    form_of_payment_id_payment_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.form_of_payment_id_payment_seq OWNED BY public.form_of_payment.id_payment;
          public          postgres    false    239            �            1259    18894    illustrators    TABLE     y   CREATE TABLE public.illustrators (
    id_illustrator integer NOT NULL,
    surname_illustrator character varying(50)
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
          public          postgres    false    213            �            1259    21621    order_items    TABLE     c   CREATE TABLE public.order_items (
    id_order integer NOT NULL,
    code_book integer NOT NULL
);
    DROP TABLE public.order_items;
       public         heap    postgres    false            �            1259    19787    orders    TABLE     �   CREATE TABLE public.orders (
    id_order integer NOT NULL,
    total_price integer NOT NULL,
    order_date date NOT NULL,
    id_customer integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    19786    orders_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_order_seq
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
          public          postgres    false    217            �            1259    18887    translators    TABLE     v   CREATE TABLE public.translators (
    id_translator integer NOT NULL,
    surname_translator character varying(50)
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
          public          postgres    false    221            �           2604    21998    admins id_admin    DEFAULT     r   ALTER TABLE ONLY public.admins ALTER COLUMN id_admin SET DEFAULT nextval('public.admins_id_admin_seq'::regclass);
 >   ALTER TABLE public.admins ALTER COLUMN id_admin DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    21999    authors id_author    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN id_author SET DEFAULT nextval('public.authors_id_author_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN id_author DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    22000    books code_book    DEFAULT     r   ALTER TABLE ONLY public.books ALTER COLUMN code_book SET DEFAULT nextval('public.books_code_book_seq'::regclass);
 >   ALTER TABLE public.books ALTER COLUMN code_book DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    22001    covers id_cover    DEFAULT     r   ALTER TABLE ONLY public.covers ALTER COLUMN id_cover SET DEFAULT nextval('public.covers_id_cover_seq'::regclass);
 >   ALTER TABLE public.covers ALTER COLUMN id_cover DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    22002    customers id_customer    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN id_customer DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    22003    favorites id_fav    DEFAULT     t   ALTER TABLE ONLY public.favorites ALTER COLUMN id_fav SET DEFAULT nextval('public.favorites_id_fav_seq'::regclass);
 ?   ALTER TABLE public.favorites ALTER COLUMN id_fav DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    22004    form_of_payment id_payment    DEFAULT     �   ALTER TABLE ONLY public.form_of_payment ALTER COLUMN id_payment SET DEFAULT nextval('public.form_of_payment_id_payment_seq'::regclass);
 I   ALTER TABLE public.form_of_payment ALTER COLUMN id_payment DROP DEFAULT;
       public          postgres    false    239    238            �           2604    22005    illustrators id_illustrator    DEFAULT     �   ALTER TABLE ONLY public.illustrators ALTER COLUMN id_illustrator SET DEFAULT nextval('public.illustrators_id_illustrator_seq'::regclass);
 J   ALTER TABLE public.illustrators ALTER COLUMN id_illustrator DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    22006    orders id_order    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN id_order SET DEFAULT nextval('public.orders_id_order_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN id_order DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    22007    publishing id_publishing    DEFAULT     �   ALTER TABLE ONLY public.publishing ALTER COLUMN id_publishing SET DEFAULT nextval('public.publishing_id_publishing_seq'::regclass);
 G   ALTER TABLE public.publishing ALTER COLUMN id_publishing DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    22008    roles id_role    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN id_role SET DEFAULT nextval('public.roles_id_role_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    22009    sections id_section    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN id_section SET DEFAULT nextval('public.sections_id_section_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN id_section DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    22010    series id_series    DEFAULT     t   ALTER TABLE ONLY public.series ALTER COLUMN id_series SET DEFAULT nextval('public.series_id_series_seq'::regclass);
 ?   ALTER TABLE public.series ALTER COLUMN id_series DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    22011    translators id_translator    DEFAULT     �   ALTER TABLE ONLY public.translators ALTER COLUMN id_translator SET DEFAULT nextval('public.translators_id_translator_seq'::regclass);
 H   ALTER TABLE public.translators ALTER COLUMN id_translator DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    22012    type_of_paper id_paper    DEFAULT     �   ALTER TABLE ONLY public.type_of_paper ALTER COLUMN id_paper SET DEFAULT nextval('public.type_of_paper_id_paper_seq'::regclass);
 E   ALTER TABLE public.type_of_paper ALTER COLUMN id_paper DROP DEFAULT;
       public          postgres    false    222    221    222            �          0    21936    admins 
   TABLE DATA           �   COPY public.admins (id_admin, surname_admin, firstname_admin, patronymic_admin, date_of_birthday, login, password, email, id_role) FROM stdin;
    public          postgres    false    237   ��       n          0    18880    authors 
   TABLE DATA           9   COPY public.authors (id_author, name_author) FROM stdin;
    public          postgres    false    210   �       �          0    19150    books 
   TABLE DATA           �   COPY public.books (code_book, book_name, id_author, id_translator, id_illustrator, id_publishing, id_series, id_cover, id_paper, id_section, page_count, year_of_publication, book_size, book_weight, "ISBN", cover_art, price, description) FROM stdin;
    public          postgres    false    230   ֖       x          0    18915    covers 
   TABLE DATA           6   COPY public.covers (id_cover, cover_name) FROM stdin;
    public          postgres    false    220   Ƶ       �          0    19000 	   customers 
   TABLE DATA           �   COPY public.customers (id_customer, surname_customer, firstname_customer, patronymic_customer, date_of_birthday, login, password, email, phone, id_role) FROM stdin;
    public          postgres    false    228   �       �          0    19410 	   favorites 
   TABLE DATA           C   COPY public.favorites (id_fav, code_book, id_customer) FROM stdin;
    public          postgres    false    232   >�       �          0    21948    form_of_payment 
   TABLE DATA           C   COPY public.form_of_payment (id_payment, payment_name) FROM stdin;
    public          postgres    false    238   ��       r          0    18894    illustrators 
   TABLE DATA           K   COPY public.illustrators (id_illustrator, surname_illustrator) FROM stdin;
    public          postgres    false    214   �       �          0    21621    order_items 
   TABLE DATA           :   COPY public.order_items (id_order, code_book) FROM stdin;
    public          postgres    false    235   $�       �          0    19787    orders 
   TABLE DATA           P   COPY public.orders (id_order, total_price, order_date, id_customer) FROM stdin;
    public          postgres    false    234   ��       t          0    18901 
   publishing 
   TABLE DATA           D   COPY public.publishing (id_publishing, publishing_name) FROM stdin;
    public          postgres    false    216   ��       ~          0    18981    roles 
   TABLE DATA           3   COPY public.roles (id_role, role_name) FROM stdin;
    public          postgres    false    226   D�       |          0    18929    sections 
   TABLE DATA           <   COPY public.sections (id_section, section_name) FROM stdin;
    public          postgres    false    224   ��       v          0    18908    series 
   TABLE DATA           8   COPY public.series (id_series, series_name) FROM stdin;
    public          postgres    false    218   �       p          0    18887    translators 
   TABLE DATA           H   COPY public.translators (id_translator, surname_translator) FROM stdin;
    public          postgres    false    212   �       z          0    18922    type_of_paper 
   TABLE DATA           =   COPY public.type_of_paper (id_paper, paper_name) FROM stdin;
    public          postgres    false    222   ��       �           0    0    admins_id_admin_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.admins_id_admin_seq', 1, false);
          public          postgres    false    236            �           0    0    authors_id_author_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.authors_id_author_seq', 8, true);
          public          postgres    false    209            �           0    0    books_code_book_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.books_code_book_seq', 20, true);
          public          postgres    false    229            �           0    0    covers_id_cover_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.covers_id_cover_seq', 2, true);
          public          postgres    false    219            �           0    0    customers_id_customer_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_id_customer_seq', 4, true);
          public          postgres    false    227            �           0    0    favorites_id_fav_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.favorites_id_fav_seq', 72, true);
          public          postgres    false    231            �           0    0    form_of_payment_id_payment_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.form_of_payment_id_payment_seq', 2, true);
          public          postgres    false    239            �           0    0    illustrators_id_illustrator_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.illustrators_id_illustrator_seq', 1, true);
          public          postgres    false    213            �           0    0    orders_id_order_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_id_order_seq', 15, true);
          public          postgres    false    233            �           0    0    publishing_id_publishing_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.publishing_id_publishing_seq', 3, true);
          public          postgres    false    215            �           0    0    roles_id_role_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_id_role_seq', 1, false);
          public          postgres    false    225            �           0    0    sections_id_section_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_id_section_seq', 3, true);
          public          postgres    false    223            �           0    0    series_id_series_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.series_id_series_seq', 4, true);
          public          postgres    false    217            �           0    0    translators_id_translator_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.translators_id_translator_seq', 4, true);
          public          postgres    false    211            �           0    0    type_of_paper_id_paper_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.type_of_paper_id_paper_seq', 2, true);
          public          postgres    false    221            �           2606    21941    admins admins_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    237            �           2606    18885    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id_author);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    210            �           2606    19157    books books_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (code_book);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    230            �           2606    18920    covers covers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.covers
    ADD CONSTRAINT covers_pkey PRIMARY KEY (id_cover);
 <   ALTER TABLE ONLY public.covers DROP CONSTRAINT covers_pkey;
       public            postgres    false    220            �           2606    19005    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    228            �           2606    19415    favorites favorites_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id_fav);
 B   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_pkey;
       public            postgres    false    232            �           2606    21968 $   form_of_payment form_of_payment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.form_of_payment
    ADD CONSTRAINT form_of_payment_pkey PRIMARY KEY (id_payment);
 N   ALTER TABLE ONLY public.form_of_payment DROP CONSTRAINT form_of_payment_pkey;
       public            postgres    false    238            �           2606    18899    illustrators illustrators_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.illustrators
    ADD CONSTRAINT illustrators_pkey PRIMARY KEY (id_illustrator);
 H   ALTER TABLE ONLY public.illustrators DROP CONSTRAINT illustrators_pkey;
       public            postgres    false    214            �           2606    19792    orders orders_pkey 
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
       public            postgres    false    222            �           2606    21942    admins admins_id_role_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id_role);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_id_role_fkey;
       public          postgres    false    226    3270    237            �           2606    19158    books books_id_author_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_author_fkey FOREIGN KEY (id_author) REFERENCES public.authors(id_author);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_author_fkey;
       public          postgres    false    230    210    3254            �           2606    19183    books books_id_cover_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_cover_fkey FOREIGN KEY (id_cover) REFERENCES public.covers(id_cover);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_cover_fkey;
       public          postgres    false    3264    230    220            �           2606    19168    books books_id_illustrator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_illustrator_fkey FOREIGN KEY (id_illustrator) REFERENCES public.illustrators(id_illustrator);
 I   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_illustrator_fkey;
       public          postgres    false    214    3258    230            �           2606    19188    books books_id_paper_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_paper_fkey FOREIGN KEY (id_paper) REFERENCES public.type_of_paper(id_paper);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_paper_fkey;
       public          postgres    false    3266    230    222            �           2606    19173    books books_id_publishing_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_publishing_fkey FOREIGN KEY (id_publishing) REFERENCES public.publishing(id_publishing);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_publishing_fkey;
       public          postgres    false    230    216    3260            �           2606    19193    books books_id_section_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_section_fkey FOREIGN KEY (id_section) REFERENCES public.sections(id_section);
 E   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_section_fkey;
       public          postgres    false    230    224    3268            �           2606    19178    books books_id_series_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_series_fkey FOREIGN KEY (id_series) REFERENCES public.series(id_series);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_series_fkey;
       public          postgres    false    230    218    3262            �           2606    19163    books books_id_translator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_translator_fkey FOREIGN KEY (id_translator) REFERENCES public.translators(id_translator);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_translator_fkey;
       public          postgres    false    3256    230    212            �           2606    19006     customers customers_id_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id_role);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_id_role_fkey;
       public          postgres    false    3270    226    228            �           2606    19416 "   favorites favorites_code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_code_book_fkey FOREIGN KEY (code_book) REFERENCES public.books(code_book);
 L   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_code_book_fkey;
       public          postgres    false    230    3274    232            �           2606    21400 $   favorites favorites_id_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customers(id_customer) NOT VALID;
 N   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_id_customer_fkey;
       public          postgres    false    232    228    3272            �           2606    21624 &   order_items order_items_code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_code_book_fkey FOREIGN KEY (code_book) REFERENCES public.books(code_book);
 P   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_code_book_fkey;
       public          postgres    false    230    3274    235            �           2606    21629 %   order_items order_items_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id_order);
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_id_order_fkey;
       public          postgres    false    3278    234    235            �           2606    21634    orders orders_id_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customers(id_customer) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_customer_fkey;
       public          postgres    false    228    3272    234            �   Z   x�3�0�bӅ;.캰��^��A��.���zaӅ�9�tLuM9J�3R�9� �qH�M���K���4����� ��'�      n   �   x�%�AN�@�;��D,Ʌ��� n9E�#Ғ�ȉ�����N.����ޜxd�ᗖ����ǁ#ۨtw��2��v���\�\CTv�x�l)��m�z��F��o�=��:�0:O��1jZ�9�.G3�9��H:qg#�A]D��*��X�3�Q;�q/�W�<O|I*��9/����"�V����=�v=3����      �      x��\�r[WvS_q�]� $AO4�$�t�<I�]yV���HP�&-ʒ�e�l��v�:�� .y�r~��_�/��k�}ι ��S�A\�nKp��k�N��U=��jR�U�jT��ɪ/��>���m��?󬺒����*�|�����ß]����l�:��v�+�����<a��ϧY�����V����U��r�`�������v����V�����߼��?�+�����_�v����lU/�eV���zX�BШ��a&��̲�OdU�U���>��������o�ø~(ݗ+��k>���7J��[.��"Y�*[Yu]�2yt^-�7�U��@�tX彥\��J�J������D~]��B��m&_\�5#������������<�sJ}�>���0yә<�����BV��.֗7���S[L���N�-�����r���5֏�aT�\�>�GʘR�]���F���Y꿄��� �@(Է�H%ޮl��dM7JB����d�0g�<(��H:�5O���T��X��ה�̼Z�����v�>��.��ʟ���0�s	V�О۷�!,�Ti�;G�TVzJa��X��v�T�_���g����R��Q!+�µ���jf��#�*e����l��TS������e�Εr�._V����D׫7A���?~�AJG�lA��5�Q�4#k���[s��J�\�O���(�uC�j�,�.�Ǚ��{U�3����?��o���<�R_�X6D?܀�1�.)��%^|mfg����Jޭ"�Sݔ�������%�P�o"_>��,�R���{����!5�{���\֭�;�@�r�D\�(=�a��ܽC���H7k�$���Uȯ�:�YI�e&NHǓ��B���	?�Tqq�l�ڱ����j���1Es�G�������O�w�o�����0��!��)����"�.��8Q����14��q"�4�J	İ�������=�OiEٚ�	��]�@��)ok���ֽ��*�v��	� r1�}�~jo�Z~j�Muz�ݽ탍n�G7��n�'��s��:��/�-���8-�W��*��Y��7`)���'N���6�W��/������)��YS�
����mu�[{Б]���n��)탠(�n{/~���z�J3�t�ۃ�خ��98ؒ��S􉡂��	��ނ+.���%�ʾA�u���~)���s�vG:s0R��M��4|�P�/E����᭹8��ۜ5����R�&�'X���k�eB�F�WG�?��+V9?����v�匄M� P5G"�-��#E��cP� ͢d��@	��6�@!L���� OO���'��si�5i饲��Z�r��v���.d�w �ZxA��U_��S;������+O��A�m�Rr��^M��*Q7T;G7-�-�σm>��x�z�hX!]ǄZj���U�?�t�/#��&���@�P�	.��7g�g��r)p�!��~�}qE\��	%��O��J;��G�4��K����1����SKs�j�U���G.�G��G���]������ẖ��m��(�������+'���
����9^(���3��U8cT�+DC����'�=�=qm�����϶ɚkb����Dڠƈ��p�ǹ��e�C5��D�x��6��(pLR?L~�;��qb�F���a,i!�DF�u�xU�hS-�:��-
�F��N�\{HĒ��XL�^U�%�k�aF���G2�����aǈZD��q�]l'U>\�0Q�h�HjyM��΃໱>�^�@uƸѵ�#52�r�&A�;�H�9�C�M7OT�~��eI:�{������N�%$��4���%1JXF�ݶh�
�D�f~���Q�ӜN�l2|����A�D�`%%	9v�5�9��2��$ҢUAtaR�� �N�8�g�+@1���j�;�6����ض��P��
|���2��9�ӈ���s��Bڧ*V�-��U%L��(pE�K���FV�FOژ�B.A�Hڈ�݄�|�Pc����k� �#jciH��4�6%RO��&ͱ��[f˔��M�h�b�j�t�/�]�1+?���2m���3�7�?DO-?�;����e�sEa�u-��\3@���3Ӑ���5����}æ:f���O)�������l��!�痰X��z6S�1��U��jH��\��a}����(�5h�$�RD�a�~m�B�;�Z��^F���zE`���ȴ@�	����X��E���°O��\�h��c�H2rk3��aE�4��%�٣䯀����h@�u���*���5��%����z�ww������F��o:^�����g�S�hA��1��:U�	6{,i��OG�.��sl�����H�"uOM�'ɗI�L�jQ[�Ê��$�ɩCf���� A�N�j�趗�i/_0Z^����M�*	�4b�}�4�E�Κ���S��.�O��]<P���!�?l5cw�)kX\��tD��LA���%��_�K��񚛄:�ra<�\�J�h�Uua�D�U�x�}��f�e�	]�}�  �ձ�+1s��*o�U$;.�.8��,�<f�&NƐ�Bmb�Fǀ���ur`z+<���׮XY�v�]�fPjͥ�bt4��� D����@5�e�I���(���)#�r��>+�&��h���׫)����� �T$�z{�z"���Q��jX಩��ۙ�� �\A��<6<��N�P���K��v��k���m��\���~S�e
�t�5�fM��h���;��ͱ*x�d�>0�f%�y��?X�Jw�;;�;��n���^����;� �v4^'��X�2szUZlh0����sz祋�U+0�uG^0��G���kq��P����k�6�#Md�������h�i�\F˸4F
�S��\k�*��
K��� c�\����\ۈ*��7@Bx��@������4��.;�����,�܌G5��_R�gƄ�op�T���i��A|1F�>_w[��D�,ac��@ТZq�xƭLocrq�q`��C�+���Mi+P)��̧�̇�/!t �������b�p'�`�N�n�U%UY$
3�A's�2f��^q�8�����[$��xC��1qj��aC]���S��խc����{���#�:�6�̊%Pm����׫V��]U{��[�������6%���$V�`Tǖ�j�����/��x����_���Z��?����r��T����'�l��g��0C��	����"����+��/���i��B1N����K��涛4�����ԏ�<Z&ɏ J�j`�#] �)�.���A-b�������|��C�X�����z}17��z���5��'��5�jAo���H���4����c��v��9���_\3���Lg�*/��U֑��� b*D`c��G�Z���>h\��LY�0�$^Q|�g.uXPM`7��DhB��@df�n,�=]�R�(�iu�֖�G���x��2iv�0���G��j5�!j�t}�}�T|p����6��g��2�+������ף5����E�0.�?\��Nr�I>a�*�x"��㚛���_�M��y�	�z��>��~���$�6���,-]�T6f�^�W�j�mr��b��@L0�"(��޿�:2�I���W�W%�L3\��%cJs,���C88�ς�b��?�j�r���"7X ��S��ֶ��k�f�"���V[c���A�g��[��؉�r�i��,C�X��W��$���5��F����Vk�Y������+Z��z[����]����DD�	n�z6�.��/�A���tV&"�@�67u�a�ۮ���QY��^hcK̈�6c��&d]>�p�1�U���R1�An���eoW*l����3Z�afѼqW��i���7�L��v�N�n� ,�w7���a���@��M�e�ŋb�\��>�e��H�s�/����:���#}��+�^2���%����_�2w�����F�9H�c/� Ⱥ��@ϡaٷs��鯑+ge��Ƭ��E"�sG� �  �il�r��#Z��+Hkn'�,�6�g��`�U��DsM�+Zqs=�̘q�܄��ֲ�>�)�Q�X��7���3��ȶ��KoN^.�{h�No�P�����ͩ�8KS�ԕg��%g��k#�/-|�'�+�������b���ל�ֵB̈�7��e�A�=�׬�6W#"v��Hz�B����G����@�s� ��5�LcBZ({�N�T���h�}CK[�fs&4��â�V	Ub�|�/�`nq
��͜�z&gL���r�R����$��c�����[w�ظ��?���>���Q�����7��,-�Ԍ�f��Z�t�`А�Y}��P�kO �>�'��x�>|g���:c�=�N����ذ�xНU����w���A�v: �=���]z_K����W}=�~_�ZU�Y�3y�g-�%Ms�[�$:S��A���Z_Z����
>j^p�5��՗�_"�=2_�ߟT_H��B��"�~+_+�W��w�����n�㌃A_ip��+����E��0g��q�A�#8�SˁY�'l��� $Twy);�D�Y������Y���3&�k�>�x�Ь���x���%�K��υCτC_�u��U2�S���xS�uE2�z�N��}U���t�5���K�~*��.���Y���Ngp�XPR���۪�a�3�q�C��͉j���t���v����)�B*���N��D���8��=��fl�w�+�B7���	7���$0���m��s�?lKg� ��V"q�c�,17`3���h�
au�80,����azD 3�Zu�+��x���G��.{YSF���cȫ���[S��v8���B�=RHl	%��(şV�4x�5�.�KŌ�8�VX@O�x�-@�>��J�]��T�)��вKc��Il0�[`ɧ~�@`Q��ŧ�I�7�綝��w����8If�WgǴ�������Pg�>8�*{��"����
�c
���	��'3|Q]��Nc2렳����;��Ն;�w�d�į���Q|�b	6&�Xrgnc��eN&�hUUwlM��N�eͱU��[9FA{�Ѭp�y���Q�����������7x�q��x�tz�U�è�2�1�Pb�U��	,U
���OF�M�~�"�K��V�dvQ���G!��D�������DE�PH:�9�5�k�E����[�x'cj��W�H��c���8���H�4{K��ʹa�2���M�ॅ<92y�c�<�Chѓ�L�Ws�*���o�bC�h�ܥ�+267��V ��E���I獜H8>dfA:�Wm�gA25��ݞW6��f����$�-����_��,�>S ġ0�#�)���ԛ�r���m,-�?u�c���,���ޱ�eӓ��L�� �KD���Ir&J�Yi�f�*�c[����Yw�2`�P5%˝�����cF+/y���0�:�{o�����Zʰ���5�H6yq��1�mс_ī�*��1V��;i��I����q|��G��P�p�(bhl�n���d�X�Hw�Ɋ�@��u�U���� q��g=e��g
��C�����>~��;��*^�*���փ�N�91�"1-HT�ނsR�U>�9�1���a����T$ځ�B��:���{�F�t�&g}.3�,Lg�[$v�Ea� 8��"�'�l�ck����IJ���S�d��e��M���<����n3��F4�v�Now�zj���hd�[���n�0�~w�1��d�oP_�����	��wm@���:�?�A�>b;a�0�a�Ք�C P)�{�d73Y�HE��K���`}sH��וD��������I�@���8���P�5_�����C���0c��  �#K�M[��T  ���;Se�=+>g��m���N��^���Д�$#���F��@���$&L3LN��*�2:_��bǵ§��dY�-��`W�mI3k�{��K����eh�%�%�E���Y��ߓ���� �~����4Զ7�j�8vd��vW[<:������U�����D__F�p��)�x��:���|��Ic�0�a�M�y�{���8=a���e~T\�n)�E"�@�0K\��0�.��x���M���,��VR�" �L�\�P��ښ@��Y�F�u�.��6e�aD�[<�@�J�2�*?P{I~M�R�n�	<�+W@���"�di��B:X�Iԭ�!/��OB�8�0��.�7ǎ|o5Q[����M��g�eyG����g�K����Ua�v(���j#b:Mf�@�_`�(q������	�l�(�����f�w酘@�o����z�Ɣ�7���t��MQ1���bw�����	�A�T6�i�x�Z�U��&.G��ǰ�G���y�m��F��ջE9_�-�~�N�#;<�ռ��si��0E�%�$»�='������a>���';����]����8+�$�1��6�'~�BZ��Y{�{����+�{Z���4Ƞt�4���5)9�񆲦�~V-]��{�GٛMT���:! ��5��,�2:�%���������12�C�$�kԭi�>�Y����1!u�q����/,I�ͅGf
�=��)#�]Y�����g��:V���Hߝ�Ζ�����v�-w_���?��tw���R�l����9+��_pyibk+�΃��J_�S-����0��eϞ��Eܗ֪��zFH۠��֜������33Ѝ�6/���M����N��#i��1R��]L���yc������a���b�g�t16~W�����`�<j��!��ze=rl�u�4��L���´���uZ\�5�^�/����[�֋�=kD�+��Vb
^���i
�;<&�d͡�Ȫ ��:��c� �.�$��L^JtvNBׂ�<��_���4z�RT:2z� �_�;��P�^y�Ɉr���  �3�:�hڽy� h�RS�1�)ne {�Jw|��8^ՋF ȣJ�sz�-���[�<��vc�8�Ll+�MP���<#�PM��I�5���y��e2��6g�.Ѵ�ds�@]��7FR��Nq�.���	`e�7kN"�P!@I�t#Zn��x�R�����>�������#�I5N��z���\�!��D��Ϋ08G�h������AGhWl*��{!�(��L1\���X.�r�f�mğ.����@~˛ؕ#�s��r��*R��Y5��Rv�!�U0=s�A���Z�dec��a����d���K��k'��"EHUpJi�ض��y5���h�j�#�FÞx����n���s���p�Flvh��/i�c%�7�B��3>�`'�0�2;w*`�j#li��|G��z��|�`-߱388����M�;{{��l#�ۋFG�`�9^$
ؐ�xi���z��g��Bx���r�`Q�!��'�k?0��_;����nf?��'�(rV�,��^d��iȪ�2,�-�y��q�C��!���k968?O[V��I/���� d.*|6|C4��dbvŐ�������8ڣ>JĕC7��V��r0%���wl����1*k�1��4$�0t+�Eՠ�4��s8�?�۪�rK����=i��1��Ʈ�X̹�����#Tn`]	�����������N�9�����O,��9���307�Cr5�lZJ��4��x�&�>��-��K�BaC��:f�6����V���V��ݻK&��D��#{Ux?��Z
��_E�Fy�
�M �`��0�۾s�������      x   <   x�3估�¦�/6\�r���N��/lr���@�&.#�s.�_�|aׅ��c���� r�+�      �     x����j�@�ϓW)+���ٛO�'�hZĤ��5Gۋ���z(H� �
!j�a��:��P�av�o~��X�	�<.�X�-c8�	�G{/��,�<��Ͳ�b5��Q��t�ă�"���1F!�R ����\���m(<Q���T�ݓ��bIQ���GL���<�9[t��]jgI���&Ҳ�ʳ׽u�O,]���b��I���|xi�;���P�-�<�or�)�&�\�h��C�� G�z�]kGВ�Ȧ��,iI!�ak����x�/�J�Q      �   7   x���  �7�b����0�0'o8`�J�y��ݜ�d�5��'�"� W	�      �   P   x�3�0�bÅ
�_�wa�����^�{aHh��v1��2�0�����v* �lP����	������ �!/m      r   /   x�3�0���{/�بpa�}.l
l���ː3Ə+F��� �O�      �   c   x���1�0�S�4����KݻT�r�`�&����)�ֆb	����t6�S�ǓW۫ʛ&��.ln7Wɜ�f�lt����_�E����U��bA�      �   V   x�m��	�0Cѳ�K�-�q�K���	ZLA��GF����h�spz��Z�Xq�S�k�Ƅ}N��N���G�EG���CDnc� #      t   7   x�, ��1	АСТ
2	Эксмо
3	Лайвбук
\.


%��      ~   B   x�3�0�¾�.6_�a�Ŧ[/���e�ya-�\�qa�/6]l K������� (!"�      |   =   x�3�0�bÅ}�_��e�yaɅ�^l���b#��qaP�(|�,��nW� �!�      v   �   x�-P;n�@�wN����\ ���PD�Ƒ)6�
(�!�Hi#!+�m���(o�����>�\9�q���v�ª�5�(Y'r���V����5~H�Z(=���5�S��S�T��fI:�~��+T�w�q2}H"?��;���&����iy�t�K}%�q6���ǧ\;|q=�1~q$������qx'�-����� C��1�=2o���b��֌���3�r��D�Rș      p   �   x�e���0D��*� H����P@ �T���!�a����e��}3;����@�'��X��P�9k����l�+d�-֔�$�~��G�78�H}D�#E�3Q
��e`��)-�|ly<S\��P��n,�D2��`�}5FI�V��?���N!a�BҨ�'�"m.�h�O71X�Cj<���8���2m�����      z   7   x�3�0�b���[/6]�{a��~.#��.츰�¾�/6 �@һ�R1z\\\ 5�     