PGDMP                         x           postgres    12.3    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2838                        2615    16393    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �            1259    16399 	   employees    TABLE     �   CREATE TABLE public.employees (
    email character varying(100) NOT NULL,
    name character varying(100),
    assignedto integer DEFAULT 0,
    lastupdate timestamp without time zone
);
    DROP TABLE public.employees;
       public         heap    postgres    false    6            �            1259    16409 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    address character varying(100),
    name character varying(100),
    numemployees integer DEFAULT 0,
    email character varying(100),
    lastupdate timestamp without time zone
);
    DROP TABLE public.locations;
       public         heap    postgres    false    6            �            1259    16416    locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    6    205                       0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    206            �            1259    16394    users    TABLE     �   CREATE TABLE public.users (
    email character varying(100) NOT NULL,
    password character varying(100),
    usertype integer
);
    DROP TABLE public.users;
       public         heap    postgres    false    6            �
           2604    16418    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            �
           2606    16424    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    205            �
           2606    16403    employees user_details_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (email);
 E   ALTER TABLE ONLY public.employees DROP CONSTRAINT user_details_pkey;
       public            postgres    false    204            �
           2606    16398    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �
           2606    16404    employees Email Foreign Key    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "Email Foreign Key" FOREIGN KEY (email) REFERENCES public.users(email) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT "Email Foreign Key";
       public          postgres    false    204    2700    203            �
           2606    16425    locations Email Foreign Key    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "Email Foreign Key" FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;
 G   ALTER TABLE ONLY public.locations DROP CONSTRAINT "Email Foreign Key";
       public          postgres    false    205    2700    203           