# Arianne Costa — Consultoria imobiliária

Site e painel em Next.js com Supabase (Postgres, Auth e Storage). Catálogo base de 460 imóveis e galerias completas. Fotos e fontes da apresentação estão em `public`.

## Situação

Esta versão foi adaptada para Next.js e compilada. O banco e o bucket foram criados no projeto Supabase `iudbimzbhmivweltdrnn`. A publicação desta versão ainda depende das variáveis de ambiente e das contas administrativas. O site original continua em sua hospedagem atual:

https://arianne-costa-imoveis.proud-luck-4398.chatgpt.site/

Os contatos, métricas, anúncios alterados e uploads da hospedagem original não são transferidos automaticamente ao Supabase. Antes de trocar o endereço divulgado aos clientes, confira e transfira esses dados por um canal privado. Nunca inclua contatos de clientes ou segredos no GitHub.

## Configuração da hospedagem

Use Node.js 22 ou superior, o pnpm indicado em `package.json` e os comandos:

- Instalação: `pnpm install --frozen-lockfile`
- Build: `pnpm build`
- Desenvolvimento: `pnpm dev`
- Produção: `pnpm start`

Copie os valores de `SUPABASE_URL` e `SUPABASE_PUBLISHABLE_KEY` do arquivo `.env.example` para as variáveis da hospedagem. No Supabase, abra Settings > API Keys e copie uma **secret key** (`sb_secret_...`) para a variável **SUPABASE_SECRET_KEY**, apenas na hospedagem. Não cole a chave em mensagens nem em arquivos do repositório. Nunca use o prefixo `NEXT_PUBLIC_` para esse segredo.

Para desenvolvimento, use `.env.local`, ignorado pelo Git.

## Contas do painel

A conta usada para entrar no dashboard do Supabase é diferente das contas que entram no painel do site. Crie os usuários do site em Authentication > Users > Add user > Create new user, com e-mail e senha e confirmação do e-mail. Não use convites se não tiver autorizado o envio de e-mail.

Os e-mails administrativos exatos precisam ser aprovados pelo proprietário e cadastrados na tabela privada `site_private.admin_emails` por um administrador do banco. Nenhum visitante ou usuário comum pode se conceder acesso. A lista de administradores não é publicada no repositório. Login por e-mail e senha em `/painel`, sessões em cookies HttpOnly e operações protegidas no servidor. A verificação também exige e-mail confirmado e sessão válida no Supabase.

## Banco

`supabase/schema.sql` registra a estrutura inicial e as permissões aplicadas no projeto. Não execute novamente sobre o banco já configurado. Novas mudanças exigem novas migrações. As tabelas de contatos e métricas têm RLS; visitantes não têm acesso direto. A chave secreta é usada somente no servidor, após validar o acesso administrativo quando necessário.

Os imóveis do catálogo base permanecem em `app/data/catalogo.json`; alterações ficam em `property_overrides`, com controle de revisão para evitar sobrescrever mudanças feitas em outra sessão. Novas fotos são gravadas no bucket público `property-images` (JPG, PNG ou WebP, até 12 MB). O formulário exige telefone e permite e-mail opcional. Depois de enviar, o visitante pode continuar pelo WhatsApp.

## Verificação

`node tests/api.cjs` testa os handlers com respostas simuladas da API, sem criar contatos reais: acesso privado, CSRF, catálogo de 460 imóveis, fotos completas, salvamento e conflitos, anúncios ocultos, telefone obrigatório, e-mail opcional, deduplicação de contatos, métricas e cookies de login. O build Next.js foi concluído e as permissões do banco foram verificadas no Supabase. O login com contas reais e os uploads precisam de teste após configurar o segredo e os usuários na hospedagem.

## Hospedagem comercial

O plano gratuito Hobby da Vercel destina-se a uso pessoal não comercial. Para divulgar serviços imobiliários, confira um plano adequado ou escolha outra hospedagem compatível com Next.js. Este repositório não foi publicado na Vercel automaticamente.

Valores e disponibilidade dos imóveis precisam ser confirmados com Arianne; o catálogo não sincroniza automaticamente com a My Broker.
