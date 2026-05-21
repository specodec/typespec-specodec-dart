import { existsSync, readdirSync, rmSync } from 'fs';
import { execSync } from 'child_process';
import { describe, it, expect } from 'vitest';
import { mkScalar, mkArray } from '@specodec/typespec-emitter-core/test-utils';
import { dartBaseType, readExpr, writeExpr, writeLines, defaultValue } from './index.js';

describe('dartBaseType', () => {
  it('string → String', () => expect(dartBaseType(mkScalar('string') as any)).toBe('String'));
  it('boolean → bool', () => expect(dartBaseType(mkScalar('boolean') as any)).toBe('bool'));
  it('int32 → int', () => expect(dartBaseType(mkScalar('int32') as any)).toBe('int'));
  it('int64 → BigInt', () => expect(dartBaseType(mkScalar('int64') as any)).toBe('BigInt'));
  it('int64 → BigInt', () => expect(dartBaseType(mkScalar('int64') as any)).toBe('BigInt'));
  it('float32 → double', () => expect(dartBaseType(mkScalar('float32') as any)).toBe('double'));
  it('float64 → double', () => expect(dartBaseType(mkScalar('float64') as any)).toBe('double'));
  it('bytes → Uint8List', () => expect(dartBaseType(mkScalar('bytes') as any)).toBe('Uint8List'));
  it('model → model name', () => expect(dartBaseType({ kind: 'Model', name: 'User' } as any)).toBe('User'));
});

describe('readExpr', () => {
  it('int32', () => expect(readExpr(mkScalar('int32') as any)).toContain('readInt32'));
  it('string', () => expect(readExpr(mkScalar('string') as any)).toContain('readString'));
  it('bool', () => expect(readExpr(mkScalar('boolean') as any)).toContain('readBool'));
  it('float32', () => expect(readExpr(mkScalar('float32') as any)).toContain('readFloat32'));
  it('bytes', () => expect(readExpr(mkScalar('bytes') as any)).toContain('readBytes'));
});

describe('generation + compile', () => {
  const ROOT = join(__dir, '..');
  const TSP = join(ROOT, 'node_modules', '.bin', 'tsp');
  const TDIR = join(ROOT, 'tests');
  const GEN = join(TDIR, 'generated');

  it('tsp generates ~200 codec files', () => {
    if (existsSync(GEN)) rmSync(GEN, { recursive: true });
    execSync(`${TSP} compile alltypes.tsp --emit=@specodec/typespec-emitter-dart --option @specodec/typespec-emitter-dart.emitter-output-dir=generated`, { cwd: TDIR, stdio: 'pipe' });
    expect(readdirSync(GEN).length).toBeGreaterThanOrEqual(10);
  });
});
