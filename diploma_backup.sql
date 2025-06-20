PGDMP     5        
            }            diploma    14.9    14.9 w    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public          postgres    false    234            �           0    0    admins_id_admin_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;
          public          postgres    false    233            �            1259    18880    authors    TABLE     p   CREATE TABLE public.authors (
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
          public          postgres    false    231            �            1259    18894    illustrators    TABLE     y   CREATE TABLE public.illustrators (
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
          public          postgres    false    213            �            1259    22054    order_items    TABLE     �   CREATE TABLE public.order_items (
    id_order integer NOT NULL,
    code_book integer NOT NULL,
    quantity integer DEFAULT 1
);
    DROP TABLE public.order_items;
       public         heap    postgres    false            �            1259    22043    orders    TABLE     �   CREATE TABLE public.orders (
    id_order integer NOT NULL,
    total_price integer NOT NULL,
    order_date date NOT NULL,
    id_customer integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    22042    orders_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_id_order_seq;
       public          postgres    false    236            �           0    0    orders_id_order_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_id_order_seq OWNED BY public.orders.id_order;
          public          postgres    false    235            �            1259    18901 
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
       public          postgres    false    233    234    234            �           2604    21999    authors id_author    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN id_author SET DEFAULT nextval('public.authors_id_author_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN id_author DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    22000    books code_book    DEFAULT     r   ALTER TABLE ONLY public.books ALTER COLUMN code_book SET DEFAULT nextval('public.books_code_book_seq'::regclass);
 >   ALTER TABLE public.books ALTER COLUMN code_book DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    22001    covers id_cover    DEFAULT     r   ALTER TABLE ONLY public.covers ALTER COLUMN id_cover SET DEFAULT nextval('public.covers_id_cover_seq'::regclass);
 >   ALTER TABLE public.covers ALTER COLUMN id_cover DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    22002    customers id_customer    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN id_customer DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    22003    favorites id_fav    DEFAULT     t   ALTER TABLE ONLY public.favorites ALTER COLUMN id_fav SET DEFAULT nextval('public.favorites_id_fav_seq'::regclass);
 ?   ALTER TABLE public.favorites ALTER COLUMN id_fav DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    22005    illustrators id_illustrator    DEFAULT     �   ALTER TABLE ONLY public.illustrators ALTER COLUMN id_illustrator SET DEFAULT nextval('public.illustrators_id_illustrator_seq'::regclass);
 J   ALTER TABLE public.illustrators ALTER COLUMN id_illustrator DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    22046    orders id_order    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN id_order SET DEFAULT nextval('public.orders_id_order_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN id_order DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    22007    publishing id_publishing    DEFAULT     �   ALTER TABLE ONLY public.publishing ALTER COLUMN id_publishing SET DEFAULT nextval('public.publishing_id_publishing_seq'::regclass);
 G   ALTER TABLE public.publishing ALTER COLUMN id_publishing DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    22008    roles id_role    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN id_role SET DEFAULT nextval('public.roles_id_role_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    22009    sections id_section    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN id_section SET DEFAULT nextval('public.sections_id_section_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN id_section DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    22010    series id_series    DEFAULT     t   ALTER TABLE ONLY public.series ALTER COLUMN id_series SET DEFAULT nextval('public.series_id_series_seq'::regclass);
 ?   ALTER TABLE public.series ALTER COLUMN id_series DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    22011    translators id_translator    DEFAULT     �   ALTER TABLE ONLY public.translators ALTER COLUMN id_translator SET DEFAULT nextval('public.translators_id_translator_seq'::regclass);
 H   ALTER TABLE public.translators ALTER COLUMN id_translator DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    22012    type_of_paper id_paper    DEFAULT     �   ALTER TABLE ONLY public.type_of_paper ALTER COLUMN id_paper SET DEFAULT nextval('public.type_of_paper_id_paper_seq'::regclass);
 E   ALTER TABLE public.type_of_paper ALTER COLUMN id_paper DROP DEFAULT;
       public          postgres    false    222    221    222                      0    21936    admins 
   TABLE DATA           �   COPY public.admins (id_admin, surname_admin, firstname_admin, patronymic_admin, date_of_birthday, login, password, email, id_role) FROM stdin;
    public          postgres    false    234   u�       g          0    18880    authors 
   TABLE DATA           9   COPY public.authors (id_author, name_author) FROM stdin;
    public          postgres    false    210   ލ       {          0    19150    books 
   TABLE DATA           �   COPY public.books (code_book, book_name, id_author, id_translator, id_illustrator, id_publishing, id_series, id_cover, id_paper, id_section, page_count, year_of_publication, book_size, book_weight, "ISBN", cover_art, price, description) FROM stdin;
    public          postgres    false    230   ʎ       q          0    18915    covers 
   TABLE DATA           6   COPY public.covers (id_cover, cover_name) FROM stdin;
    public          postgres    false    220   ��       y          0    19000 	   customers 
   TABLE DATA           �   COPY public.customers (id_customer, surname_customer, firstname_customer, patronymic_customer, date_of_birthday, login, password, email, phone, id_role) FROM stdin;
    public          postgres    false    228   �       }          0    19410 	   favorites 
   TABLE DATA           C   COPY public.favorites (id_fav, code_book, id_customer) FROM stdin;
    public          postgres    false    232   6�       k          0    18894    illustrators 
   TABLE DATA           K   COPY public.illustrators (id_illustrator, surname_illustrator) FROM stdin;
    public          postgres    false    214   ��       �          0    22054    order_items 
   TABLE DATA           D   COPY public.order_items (id_order, code_book, quantity) FROM stdin;
    public          postgres    false    237   د       �          0    22043    orders 
   TABLE DATA           P   COPY public.orders (id_order, total_price, order_date, id_customer) FROM stdin;
    public          postgres    false    236   &�       m          0    18901 
   publishing 
   TABLE DATA           D   COPY public.publishing (id_publishing, publishing_name) FROM stdin;
    public          postgres    false    216   l�       w          0    18981    roles 
   TABLE DATA           3   COPY public.roles (id_role, role_name) FROM stdin;
    public          postgres    false    226   ��       u          0    18929    sections 
   TABLE DATA           <   COPY public.sections (id_section, section_name) FROM stdin;
    public          postgres    false    224   �       o          0    18908    series 
   TABLE DATA           8   COPY public.series (id_series, series_name) FROM stdin;
    public          postgres    false    218   R�       i          0    18887    translators 
   TABLE DATA           H   COPY public.translators (id_translator, surname_translator) FROM stdin;
    public          postgres    false    212   \�       s          0    18922    type_of_paper 
   TABLE DATA           =   COPY public.type_of_paper (id_paper, paper_name) FROM stdin;
    public          postgres    false    222   @�       �           0    0    admins_id_admin_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.admins_id_admin_seq', 1, false);
          public          postgres    false    233            �           0    0    authors_id_author_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.authors_id_author_seq', 10, true);
          public          postgres    false    209            �           0    0    books_code_book_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.books_code_book_seq', 23, true);
          public          postgres    false    229            �           0    0    covers_id_cover_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.covers_id_cover_seq', 2, true);
          public          postgres    false    219            �           0    0    customers_id_customer_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_id_customer_seq', 6, true);
          public          postgres    false    227            �           0    0    favorites_id_fav_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.favorites_id_fav_seq', 97, true);
          public          postgres    false    231            �           0    0    illustrators_id_illustrator_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.illustrators_id_illustrator_seq', 1, true);
          public          postgres    false    213            �           0    0    orders_id_order_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_id_order_seq', 3, true);
          public          postgres    false    235            �           0    0    publishing_id_publishing_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.publishing_id_publishing_seq', 3, true);
          public          postgres    false    215            �           0    0    roles_id_role_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_id_role_seq', 1, false);
          public          postgres    false    225            �           0    0    sections_id_section_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_id_section_seq', 3, true);
          public          postgres    false    223            �           0    0    series_id_series_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.series_id_series_seq', 5, true);
          public          postgres    false    217            �           0    0    translators_id_translator_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.translators_id_translator_seq', 4, true);
          public          postgres    false    211            �           0    0    type_of_paper_id_paper_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.type_of_paper_id_paper_seq', 2, true);
          public          postgres    false    221            �           2606    21941    admins admins_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    234            �           2606    18885    authors authors_pkey 
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
       public            postgres    false    232            �           2606    18899    illustrators illustrators_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.illustrators
    ADD CONSTRAINT illustrators_pkey PRIMARY KEY (id_illustrator);
 H   ALTER TABLE ONLY public.illustrators DROP CONSTRAINT illustrators_pkey;
       public            postgres    false    214            �           2606    22048    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_order);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    236            �           2606    18906    publishing publishing_pkey 
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
       public          postgres    false    226    234    3265            �           2606    19158    books books_id_author_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_author_fkey FOREIGN KEY (id_author) REFERENCES public.authors(id_author);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_author_fkey;
       public          postgres    false    230    210    3249            �           2606    19183    books books_id_cover_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_cover_fkey FOREIGN KEY (id_cover) REFERENCES public.covers(id_cover);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_cover_fkey;
       public          postgres    false    220    230    3259            �           2606    19168    books books_id_illustrator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_illustrator_fkey FOREIGN KEY (id_illustrator) REFERENCES public.illustrators(id_illustrator);
 I   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_illustrator_fkey;
       public          postgres    false    3253    230    214            �           2606    19188    books books_id_paper_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_paper_fkey FOREIGN KEY (id_paper) REFERENCES public.type_of_paper(id_paper);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_paper_fkey;
       public          postgres    false    230    222    3261            �           2606    19173    books books_id_publishing_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_publishing_fkey FOREIGN KEY (id_publishing) REFERENCES public.publishing(id_publishing);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_publishing_fkey;
       public          postgres    false    3255    216    230            �           2606    19193    books books_id_section_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_section_fkey FOREIGN KEY (id_section) REFERENCES public.sections(id_section);
 E   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_section_fkey;
       public          postgres    false    3263    230    224            �           2606    19178    books books_id_series_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_series_fkey FOREIGN KEY (id_series) REFERENCES public.series(id_series);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_series_fkey;
       public          postgres    false    230    218    3257            �           2606    19163    books books_id_translator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_id_translator_fkey FOREIGN KEY (id_translator) REFERENCES public.translators(id_translator);
 H   ALTER TABLE ONLY public.books DROP CONSTRAINT books_id_translator_fkey;
       public          postgres    false    230    3251    212            �           2606    19006     customers customers_id_role_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id_role);
 J   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_id_role_fkey;
       public          postgres    false    226    3265    228            �           2606    19416 "   favorites favorites_code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_code_book_fkey FOREIGN KEY (code_book) REFERENCES public.books(code_book);
 L   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_code_book_fkey;
       public          postgres    false    230    232    3269            �           2606    21400 $   favorites favorites_id_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customers(id_customer) NOT VALID;
 N   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_id_customer_fkey;
       public          postgres    false    3267    228    232            �           2606    22058 &   order_items order_items_code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_code_book_fkey FOREIGN KEY (code_book) REFERENCES public.books(code_book);
 P   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_code_book_fkey;
       public          postgres    false    3269    230    237            �           2606    22063 %   order_items order_items_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id_order);
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_id_order_fkey;
       public          postgres    false    237    236    3275            �           2606    22049    orders orders_id_customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customers(id_customer);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_customer_fkey;
       public          postgres    false    228    236    3267               Y   x�3�0�bӅ�/캰��^��A��.��|�����@��F�������%���ٜ�@ �8��&f��%��rr��qqq �$'�      g   �   x�%�KNAD��)���+��>�2b� � P,��0�&�	Wx}#����jW���{&~i�V$��ٲΕz�Ə�e�⇁����F�1W~a�h�M��m����*�1y<4�t��ޅ)�PXL����W1��xG�N�	|J�W)xT�Gy,�.o���VР0����${x���.HO����������f�������sS���偻�t��G      {      x��]�ncWv����#���$ʓ�d�y�'	������zȑ\*Wٱ��.��n;@��"���������_������sI�\�A���"y�쳟k�s��4�'崜Tg������B�-W��4+��_�yU���i�6����?w��F����;��Fg����	��>κ�V���nV�����Ago�s��i�m���F������߼��?����i��?�m����6���*������jX2�Q9���|<�a�X~z/+�W��Qu\=�K���F>����\����񟏾�!ɼ��H/�.ʢ����(�GO˕���[��7UCyo!׬�B�R��x�R��P~]��2$�\���kF�q�Q-e�'�:/�S������7��ӎʩ�^�U�����-�Gx��&S���S}�T�YpnS�5�9V��a��8�Iu���U0���T��F���Y��D��� ��P�R=�(�v�u&s��!4)?}���"��U�j�!|���:�w?Vy�5�sZ.��w��s�CY�"I��P�U�Ź�����̩�}j��TT�0�S��9*g2�S
��,�2x���B��:���29�*!D)2�ݗ���v��1R�R��z��F�N-E_+"?kn�^��\� W���ayK��>���M��k���Gf��.[R+�r�HT.�({<���ץ�Z�P�S��3
�J��2ϸJ�q�o�Z��\ol����U�W���_�˂�m�q��	�/�6��L�Y_%�V����t�,{	%/`K����D�| �3x��~�U����CZ�੭��[�7�B�q�E]�Fz*��*ɠH�
���"ܼ6$�R���Q���t\��d�x�|Z�]X8��.�%P?����QK�~9�j��8W[| �#�)���uW��ƛ]1���:����P��5Q'F���~��E�(;]��jX�tt�Tg��RߧcEݚ�̪�]�0r�S�ֺ��nF��T�e�p	��j��6��~�����Z�jv�{�;�[�T�ajO��Ϫ�C�����M/FC	Z��oUO(Y��7)=U�H�<MGZ�^9m�1��dOz��^�5ê`�3[�F��؇���^�V��5KiC�tZ��C�m��]7�~�����o��z����Æ,�w�O�LM���Bq���".�V����k�G���"�K�~��"��=)T�M��4Q|�P�/�.�3-[��N%�/��l(n��:6U~�Ɏ,�%_&#��h�H��Pw�U�!�S�v��DL�"�4G�=w7��3:Qq������ٷ��v���n��Í���L����wy�Xx�����=���P�B� �=d�5^��Aj��`��@�y��a��ty��>e���a�B�3�M�t��6�x�O�}WpX��zr6�4J=�'����E�x��j�ʞ�D�mp�!u��=�L��>w퓡},w3>��
EKzd��fL.���嵬��
�Cd8F|ê1�(4D�nB.9s�ݬ�7y�z@�uό.��(5
��/JQ�@yNXH��S�?3;\p
���D�\��9VvhI�򋿲��c��.PM�z��9d�q�T�ʤ�ZQ�S�Z��h�ΐΐ�5����uâ������TC��0���)k.S�g�������Us��z,Գ=��_i�q��&V8��B�0J��[��r�H�.X�|{	m�����oM�Tt�Uù=�zR<�uR/`7Gj�*�q��?E��� �k��!����5�(��uK�sf��gv_�����d���f��F����R���Z������~w��5���W��1�])H4���N%���F=�bσ'���3�\W&ʅ:�4�tqEӒg����Y%yժIk�/*��"��h@&��,� ��_g-uO�+�Cn��V�>�z۬��E�5���uLV��Y�_�pr��pHD-�@�.(8��C�Z�߬?��6W�dbqE�s�DA��2MC���3פ���>��0�u)�B$�ˏ&���*/,))�g!OՔ��)�U���P�!�>�f�uD7�L̝�,(����B��D�cE7�a9-�iCw:���|��Q��Q}�b��qq�Y�'n�-F�k[j��}�	��@�P�1 .�
U��i$y� �d^��6�9�?��:��&���4c�a^��lƬ�#�A-�'�j{=X�8��
����D�cAȦ�[�ne�C:|5�Y�{�E�?�N̸��K�U��[��r+os��0�~AƐ��;�$4j�̛����!�;����Pg�d�>0�n����ntR:�ݝݭn/���èWn%�NKR��&��&	���M��Ff�`T�ǆ�A��`t^�����x�C�=�ǏY�gs	��"m�4C�43c�<��\��I�lY��XM���X)`M�s�9;ׄ�9^�f��0����hHɵ��2�u4�WyH�Cby+�<�e1�M��9Q�X��������K�T�u���?XZ<3�`��/�(^4��j�Zp�ѡ�����u�s.ez���A(+/��\E���.JK��(����:g�
lqih�����v".ؕ������CU��c�	�rs�g/�v���r��M+�RɲF�C����#���?�-?R�Es��p�e3~} �9!l�).h��؍���Z����d��una�'��}�5���È��#��s�����W�_����y��w�����[-��Ox*���[��	�[c�Y��>�P�r �
�w�Jp����H�t��\���ѥ�w:!�&�Xg:����R
^��>QTɲ�!͑.���ߞ\�%�H�,N�@O /���/�<n\PY��?��G���ԂR������k>�1N�5����o���J�4B���k��v��9�
j�^_\���1��P��_>ᫌE�
��"b&��²��a��jU������� �������K<s�K�&@�v��	A�.t�U��|ߍ�܁�=�҂^�aT<i[�9e���z�JZ:��]��pO�2y_��CT#�ɓY�k�q��w���Z�;�Ԋ��ц�j�"��n�?� y�$��L�?t ���F����^)Ln�y�])�[����A��H@�m����UI'`+��\��M��H���=�d�y0R��+dzS����^��SE�Ԡ֔Xr���C98�ϒ�b��?$5�uB��V�a�Ը��_�P��"al^*ʉ�Za�5��F��;�t����5A��,�So�X��]�O�F!��J,�H�
�fmk��f#kj;����P^B���m8S�/�L�1x�E��.��=F� �c�s��-����D�M��}�� 0�Ӷk"�St�.��gb��h��9��4�u�,ý�Q]�"oS�x�Y�d�2�ۍ
g~�pDE3ܬ�<���B�+pU��!����B�`X��$�G*#�%іor-k��ir�ʸ�x�ϕ�F_�����@�Wh�zI<y%��Z�<ج2�z�������O�c/�����kZ5��u;��� ��8�*#6���Ȍ��4w�����%8�W-���v���-���@<����:�䚦w���z��q���0��nkUO��6�?j{\�F�]�j�h�CD����r���-0�yK�K�Cr��L���.��f��y���H�<���	��)���x�"g [!�qA,�}�k�hČ8�ڳ��2@P�k�5����cED���&�i�W����h(1�̱+�>�
�^�o�3S�H�Ȟ�lp�<�1�(�gϙ���_�	���̃r���:�Pe������!�&��7��?t$gL����KnY��KB�xʭ�,s��7��s�����?�x�(���1qg��@O͉�+�ߴ��k�����+�BQ�=�j�~ѕ�%z�;����{Aw[{1����+tw=��w����-}�CD��ݾ�z�ǜ�]�����x�Y~)�ד��oՄ>��~"���ɶ�Y���Ƙ3�!�C�>�¥D��¸.2�f��0��@�qD �  ��#�'2�����ϥ�z.Sy�����u䟕���|�p�W̶�q����\�:���g���8,�V?��Q�S����	���.$��˻��?Q�!���B����lT[#���7��x9�'[<]1��[�L$�H�+󎟳K�v���;'�+���kw���kϙ�yq�`��P{�]���R��s��m����k���Q������n������
�'�� ��n�=�9��CB*օ��
J;C&��9<�e:�H_W5Tޱ(���⮲'���G�o�xzd�ܯ昁��mLv	Ҵ7�� .0 ��$K,,�cel;�����80,[{��B�:�J7F�W���w"eo"+dt�x;������q��Qp�K��9
s��<M��-Ip.:�K2e�a�Rql�������S��|#ƒK�c���'lF���4V�N�+����@.�Է��)->}'�H����qa���F{	�D���;h7������k��r�f��*�����k��ڍ[Mzɾ�h��V����}��-Ň;���j���w�d�ů�-�T�Ĩ�d�L6��"�X�.\uGFr�Ӳ,�Lc���;6�y�i�%G�l%{k[���
�+_��ny������@|wl�G�9�A&�����i���d%�Qee!c���6/�=g�� @!(���d�[�gif}�e�	�ڝ�`��� ��3Jl���{m�\�V��t����-����0��;�[�|+#�A��1�E�KaK��r�g�2�/@�[����r$���g
$/	@�MF���y����kT�7��PkZ���-��Fk��ޤ��؞Y�t^�D������σf*���^`X^ϒ��$��Q�6	���p`���&@S:t�b^S���-Q�_3q���2Vޟ�j���x{Zw,�b�=f�����2=(�
�&d�0�ǟXVZ���J����*'�.���LM���P���#"���<s�9��	;7�҇`��ʰmO����$y�"�,��6�/��4�͛���;� �Ȋ���giy�r�.@9�V�#�خ潹�ɊX(�kHW�.��B����#T����"q�Af'��Ą�mT����w2��䎍`<G��c�W��� �	='B��:v���[���24�>���G���Ӑ���S\ul�����	tN�3���s�Yd�D&]Tvj�l�/�)��XCbf�M 2զ�ȴ$}�J����/4y�Y���y�ӟժ�7[w�{��if�'���W4:��^mn���{�u���I��d��N�N�@�pˮ�OW�r��G�
�'�"���ca%,Nca=%���@V
pHv�z	x=t=.��������k@���ϮS�¤@�N�Yܼ<	Z�u�w��ܹ��j����5���|�|��3�=k>#����!�N<�_��Q6���	"���N��@lx�`IL3�,BW�mt�D'EƵ�O+�d N��صwD_R`��7�����cg�b��o	���<�E��]����Fg�ѯ�m��OͶ�U~��v�)��a�xK��C*d�/���4\��0��m�c6Z���pB����%�D��y|)��Wf�<���5�_����&��Id� Ա
{���FC��k�sVX�gY[��Vҹb�=�M��<�� ��:��;�5pEt�ԈȜ�|`����<)SV�u��!T.�o�R�{"���芵$����l�[I/2��U?�@'�Q��������N�Id�;�D})�2��.�E8�(C�;
�.Vh���ԔjXVj�6�_����L�;��/0c�:\���u	9m�+���h�-{�ވYKC��M%_oҙy3t��Ӊ_ā(D��΋=�q�{���A�TE�w�|�V�E?�z���~u�|?�i��}���X�-����"�d�����f�n�ϕmv�+
!	��*��̞��������"|�߂Ow[ܕ��m�$Zb�I��$*����iTg�ڛ�s�Oh����'�Nm���Oܒ���n�kj��g��%��Q�z=����A$(�G��UY��=10�|�{@տ��7���T���tG���5x��H4G\�"�si�\80W��*F��r���L���y:k'	r+�hߝn��.��[m���`�F��8HBth}���;�ꍃm;�N����{�v��u\/1got��� e;���7	��_���#8k�7,��$�p��e�5:6�uf�8���єt���6h}FԎ�R���0ΔI1�`�s��V?�8��v/7@�1�e����i�+K	3��&�i�E���ƞZ���ㆎ���5(Hn�dC�pk��7ƶ�(�i�������쾹
����<r��<��2g"Y�x*k�D #�����b�Q`I�#wl��A#�CW����k�-\ԡea;�`�!+��
��`\�޽p����( I��`t8���x�L����Cla	{Z�M&F���)ٳ�nc!p\ ci(d�zh��a�*Ì����p������Ť��T��4����9vw*�5W(v��㈭�'G�����d�� �؋���R�֝�v��d��m�Z�t^�7|�����tnk��Wԓ��D�`Mi�+��ܬ4Q���"�%��S%�Ԏו�h'�p����$t�X��z]8���9�'�I�e�c����x�]�&oCޟpOm8h6���V%r�r��NI���yC\I���Vܛ����`���X"�Q=
�e������F�c(�EF�O{ʌd ֗Jܫ�Q��R �7
�����m�v�4w����F�aǻ�!ˣ��l���������������u5��^�ܡ1|�!����F(p�*�8��/3�͸����R�?�[B�}7��5��_���4��8ڌ���?���U}�q�4	�I��,��<��`UhA�2��IX��$2q"��W�a����xm��⬇j`Ә9��D	���܌;�>1����c��a�V�F`'^Mi.Z3� Ái���1��}<  l��Ԉ�K�t�Ql�*�^����7H�i}�~I��?�<5�܂]�c|��.���+݅�cl�ږ��J���[*��1������pv�yᫀ(o��B�`�ch����_�vLI�\�����jg��ڲ~\ �;��j�Թ�7[���+_���t�_�@�Ҿ�Tc��B q�����5,����t����J��� v���"կ�C��A�|rO?m�Z�8{x���bV|p��HM	�o��3+T�����'�lk(Ȃ��/�ge��p}N/'����ɧx���1��D&7WD�a'F�ޥt����y~� ��/T9�n�����d�1xɹ�堠�/+Mj�1�)̶Ǧ(') ���#�1�����4*쥷\֝d��S��'uK��uj�%�[QZ_��#=�\EWv���P<�<&iQ��@h�ξ��"@�NL�����P��_�$�U�shS�o��&希X"��;�ܟ���H��*/��fP!M��������%y�� ���s7d��"�h�l�a>D�]�"θzs�6b��R����	BXiz�\�Ey���AK2�ֶ�h8���;�V:Qw�N,lCI��G��p���T�a�K;���*�i�m��[��iF ��6w���6Z�#gja�<J�gU(�L��O|����5W��g�����lE��a�~IgY.T�y�����m�v�\�ͦ�E��ۭ;w��/���$      q   <   x�3估�¦�/6\�r���N��/lr���@�&.#�s.�_�|aׅ��c���� r�+�      y   ;  x����j1�ϳ�R"�d���O�'�t[d�*.�{���cN=�o RA�i_a��:�U[A*�@f�/�(�7�ӌ��E�Cqԥe1e��e�{�nj����0�,���nƹK����pѰ�*��胖�)&ŋ���iV����LkZЪ���On��-� ��Bօ���Iꀙ�Z6�S�흲����;�+-<v�+��4BF�3�����c������ҫ���y�X'к,�&��r�QBs�Ia��Ok���)C�_Cֹ�`0�C�a+����@���E���E��(P���s�'.�CD�9�ժA��T�      }   ?   x����0��0L��čw��s��KBw�	67�_R���<	W�/���=���^$?�U      k   C   x�3�0���{/�بpa�}.l
l���ː3Ə˘��~ o?�	�}v]�paW� ���      �   >   x�%���@B�33����_G�|z������X�B�h(�Ih<qM��Y����$Z�\      �   6   x�3�4475�4202�50�52�4�2�45��
�� e��9���̌Pc���� a�
u      m   7   x�, ��1	АСТ
2	Эксмо
3	Лайвбук
\.


%��      w   B   x�3�0�¾�.6_�a�Ŧ[/���e�ya-�\�qa�/6]l K������� (!"�      u   =   x�3�0�bÅ}�_��e�yaɅ�^l���b#��qaP�(|�,��nW� �!�      o   �   x�-P;N�@�wN��� '�B(�#�DA;�HtR�HQ`�b;���(o�����>3��.��a��V贴[F�-y�c��Q�Q#x-=>t�o{�2ag�!�M�:|���Q�d��뙑�F_�I��?!�-���U�pSd��:������G�w��c�}��M�O,d��xfBa��bML߯ӌl��+9vxc̐����E���Sщ93m��1?�1&�!wC� '���r����"�b�      i   �   x�e��qAD��(&(��ع,p�ჲ]ñ�,)�dDk���?*i��Փ�v��8#Å�;�Qq(Ä5�^{���;rKJ
�0FR�v$��R�I�gGԆut�aJ�#�%|�9��s���6D�0ӡ���~m�61�����٧`�-lU��zK]j���z��0fH��\߸����&���C�D��(u�V�'��ԗ      s   7   x�3�0�b���[/6]�{a��~.#��.츰�¾�/6 �@һ�R1z\\\ 5�     