# Arianne Costa — Consultoria imobiliária

Código do site e do painel de administração de Arianne Costa.

## Endereços atuais

- Site: https://arianne-costa-imoveis.proud-luck-4398.chatgpt.site/
- Painel: https://arianne-costa-imoveis.proud-luck-4398.chatgpt.site/painel

## Recursos

Catálogo de imóveis, galerias completas, formulário de contato, painel para editar anúncios, acompanhar contatos e consultar métricas agregadas de visualizações e cliques no WhatsApp.

## Hospedagem

Esta versão usa Vinext/Cloudflare Workers, banco D1, armazenamento R2 e autenticação da hospedagem Sites. O GitHub guarda o código; não substitui os serviços de produção. Para hospedar na Vercel, é necessário adaptar a autenticação, o banco e os uploads antes de publicar. Não basta importar este repositório na Vercel.

Os contatos recebidos, as alterações de anúncios feitas no painel e os arquivos enviados para R2 permanecem nos serviços de produção; não estão incluídos neste repositório. Não coloque senhas, tokens ou dados de clientes no GitHub.

## Estrutura

- `app/data`: página pública, catálogo base e galerias.
- `app/painel`: painel privado.
- `app/api`: endpoints de imóveis, contatos, métricas e imagens.
- `db` e `drizzle`: esquema e migrações do banco.
- `public`: imagens e fontes do site.
- `scripts/test-admin.cjs`: verificações dos handlers administrativos.

## Desenvolvimento

Use a versão do pnpm declarada em `package.json`, instale as dependências e configure os bindings D1/R2 e a autenticação em um ambiente compatível. A identidade do proprietário é configurada pelo segredo `ADMIN_OWNER_EMAIL` na hospedagem, sem valor no código.

Dados do catálogo são uma base manual e não são sincronizados automaticamente com a My Broker. Confirme valores e disponibilidade com Arianne.
