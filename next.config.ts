import type { NextConfig } from 'next';
const config:NextConfig={outputFileTracingIncludes:{'/*':['./app/data/*.html','./app/painel/*.html']},serverExternalPackages:[]};
export default config;
