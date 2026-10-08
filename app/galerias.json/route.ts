import {catalog,photos,json} from '../store';
export const dynamic='force-dynamic';
export async function GET(){try{return json(Object.fromEntries((await catalog()).map(p=>[p.id,{images:photos(p)}])));}catch(e){console.error('gallery',e);return json({error:'Galeria indisponível'},503);}}
